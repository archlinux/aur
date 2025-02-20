pkgname=ytui-music-git
pkgver=2.0.0
pkgrel=1
pkgdesc="Youtube client in terminal for music (lightweight youtube client)"
arch=('x86_64')
url="https://github.com/sudipghimire533/ytui-music"
license=('GPL2')
provides=(${pkgname})
conflicts=("ytui-music" "ytui-music-bin")
depends=("mpv" "youtube-dl" "sqlite" "git")
makedepends=('cargo')
source=("git+https://github.com/sudipghimire533/ytui-music.git")
sha256sums=(SKIP)
options=("!buildflags")

build() {
  cd "$srcdir/ytui-music"
  git submodule init
  export MPV_SOURCE=/usr/bin/mpv
  cargo build --all --release --features build_libmpv --locked
}

package() {
  cd "$srcdir/ytui-music"
  
  install -Dm755 "target/release/ytui_music" "$pkgdir/usr/bin/ytui-music"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}

