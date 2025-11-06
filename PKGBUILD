# Maintainer: Qian Chen <qc@az.ht>
pkgname=goweb
pkgver=0.0.8
pkgrel=1
pkgdesc="Multi domain/host web server written in Golang"
arch=('x86_64' 'aarch64')
url="https://github.com/elgs/goweb"
license=('MIT')
depends=()
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -o goweb
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/goweb" "$pkgdir/usr/bin/goweb"
  install -Dm644 "$srcdir/$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/goweb/README.md"
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  go test -v -run TestExtractSQLParameter
  go test -v -run TestSplitSqlLabel
}
