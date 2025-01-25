# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=yaylog
pkgver=2.2.0
pkgrel=1
pkgdesc="A CLI utility to list recently installed packages with filtering, written in Go."
arch=("any")
url="https://github.com/Zweih/yaylog"
license=("MIT")
makedepends=("go")
depends=("expac")
source=("$pkgname-$pkgver.tar.gz::https://github.com/zweih/yaylog/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("6d767f574e59fad9d5be274e2a59dac2946860611f532d32f56417ee94cd776d")

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