# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=yaylog
pkgver=2.1.0
pkgrel=1
pkgdesc="A CLI utility to list recently installed packages with filtering, written in Go."
arch=("any")
url="https://github.com/Zweih/yaylog"
license=("MIT")
depends=("expac")
source=("$pkgname-$pkgver.tar.gz::https://github.com/zweih/yaylog/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("7b652388798c8a8e91654ec938d8df8808bf0adf27b4b6b6d18be9e047c949b9")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CGO_ENABLED=0
  go build -trimpath -o "$pkgname" ./cmd/$pkgname
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}