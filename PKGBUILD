# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=yaylog
pkgver=2.0.1
pkgrel=1
pkgdesc="A CLI util to list recently installed packages with filtering, written in Go."
arch=("any")
url="https://github.com/Zweih/yaylog"
license=("MIT")
depends=("expac")
source=("$pkgname-$pkgver.tar.gz::https://github.com/zweih/yaylog/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("8fbb88d98ff57a0d7edb9ab684662fd32d1fb1ca52b2f255164b2a947cc08303")

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