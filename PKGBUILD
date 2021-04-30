# Maintainer: David Florness <david at florness dot com>
pkgname=tallyard
pkgver=0.3.1
pkgrel=1
arch=('x86_64')
pkgdesc="A peer-to-peer voting system that ensures voter privacy while preventing double-voting"
url="https://tallyard.xyz"
license=('AGPL3')
makedepends=('go>=1.11')
source=("$pkgname-v$pkgver.tar.gz::https://git.hnitbjorg.xyz/~edwargix/tallyard/archive/v$pkgver.tar.gz")
sha256sums=('701b4aea01120ca88ea3b1388c0e02c0bd3de8227c73967faff2db6dc89646b5')

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
