# Maintainer: Qian Chen <qc@az.ht>
pkgname=gosqlapi
pkgver=0.0.47
pkgrel=1
pkgdesc="Turns any SQL database into a RESTful API"
arch=('x86_64' 'aarch64')
url="https://github.com/elgs/gosqlapi"
license=('MIT')
depends=()
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -o gosqlapi
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/gosqlapi" "$pkgdir/usr/bin/gosqlapi"
  install -Dm644 "$srcdir/$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/gosqlapi/README.md"
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  go test -v -run TestExtractSQLParameter
  go test -v -run TestSplitSqlLabel
}
