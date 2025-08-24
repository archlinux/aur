# Maintainer: KrishnaSSH krishna.pytech@gmail.com
pkgname=gophertube
pkgver=2.8.0
pkgrel=1
pkgdesc="Minimal terminal YouTube client with mpv, fzf, and chafa previews"
arch=('x86_64' 'aarch64')
url="https://github.com/KrishnaSSH/GopherTube"
license=('GPL3')
depends=('mpv' 'fzf' 'chafa')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')

build() {
  cd "$srcdir/GopherTube-$pkgver"
  export CGO_ENABLED=0
  go build -ldflags "-X main.version=$pkgver" -o gophertube main.go
}

package() {
  cd "$srcdir/GopherTube-$pkgver"
  install -Dm755 gophertube "$pkgdir/usr/bin/gophertube"
  install -Dm644 man/gophertube.1 "$pkgdir/usr/share/man/man1/gophertube.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 config/gophertube.toml "$pkgdir/usr/share/doc/$pkgname/gophertube.toml.example"
} 