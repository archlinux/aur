pkgname=ytui-music
pkgver=2.0.0rc1
pkgrel=1
pkgdesc="Youtube client in terminal for music (lightweight youtube client)"
arch=('x86_64')
url="https://github.com/sudipghimire533/ytui-music"
license=('GPL2')
provides=(${pkgname})
conflicts=(${pkgname}-bin ${pkgname}-git)
depends=("mpv" "youtube-dl" "sqlite")
makedepends=('cargo' 'tar')
source=("https://github.com/sudipghimire533/ytui-music/archive/refs/tags/main.tar.gz")
sha256sums=("f7718ab8d9f24b63bb9b69e92619afd056c4e4e55152eacdf8a4ec4ea22e6f78")
options=("!buildflags")

build() {
  cd "$srcdir/ytui-music-main"

  cargo build --all --release
}

package() {
  cd "$srcdir/ytui-music-main"
  
  install -Dm755 "target/release/ytui_music" "$pkgdir/usr/bin/ytui-music"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}

