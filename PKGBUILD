# Maintainer: David Florness <david at florness dot com>
pkgname=tallyard
pkgver=0.6.4
pkgrel=1
arch=('x86_64')
pkgdesc="an authenticated voting system that ensures voter privacy while preventing double-voting"
url="https://tallyard.xyz"
license=('MPL2')
depends=('libolm')
makedepends=('go>=1.18')
source=("$pkgname-v$pkgver.tar.gz::https://git.hnitbjorg.xyz/~edwargix/tallyard/archive/v$pkgver.tar.gz")
sha256sums=('b34e07f7b7868d1a5122f0ce59129c5e1abfe9b3c04b415ebce1f99e46dfdcf7')

build() {
  cd "$srcdir/$pkgname-v$pkgver"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOPATH="$srcdir"/.go
  make
}

check() {
  cd "$srcdir/$pkgname-v$pkgver"
  go test ./...
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
