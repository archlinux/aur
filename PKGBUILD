# Maintainer: Your name <bros at brocode dot sh>

pkgname=fbmirrors
pkgver=0.0.3
pkgrel=1
pkgdesc="Arch mirror list generator"
arch=('x86_64')
url="https://github.com/bomgar/fbmirrors"
license=('custom:GPL-3.0')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('13fbc715d332ed87ae1f00dd768ab36a3e949bafee67c96c4367347db11cebaa')

prepare() {
  cd "$pkgname-$pkgver"
  go mod download
}


build() {
  cd "$pkgname-$pkgver"
  go build -o fbmirrors -ldflags="-X main.version=$pkgver" main.go
}

check() {
  cd "$pkgname-$pkgver"
  go test -v ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
