# Maintainer: David Florness <david at florness dot com>
pkgname=tallyard
pkgver=0.4.5
pkgrel=1
arch=('x86_64')
pkgdesc="A peer-to-peer voting system that ensures voter privacy while preventing double-voting"
url="https://tallyard.xyz"
license=('AGPL3')
depends=('libolm')
makedepends=('go>=1.13')
source=("$pkgname-v$pkgver.tar.gz::https://git.hnitbjorg.xyz/~edwargix/tallyard/archive/v$pkgver.tar.gz")
sha256sums=('4864969cd025a785e8af659a526df493659b21e92206526c89c838027be03134')

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
