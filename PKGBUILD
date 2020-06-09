# Maintainer: David Florness <david at florness dot com>
pkgname=tallyard
pkgver=0.1.0
pkgrel=1
arch=('x86_64')
pkgdesc="A peer-to-peer voting system that ensures voter privacy while preventing double-voting"
url="https://tallyard.xyz"
license=('AGPL3')
makedepends=('go>=1.11')
source=("https://gitlab.com/edwargix/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('3867a92611e69a60ead4cb1016b9547ac4275b018706b0e9f230476e86799b71')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOPATH="$srcdir"/.go
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
