# Maintainer: David Florness <david at florness dot com>
pkgname=tallyard
pkgver=0.4.4
pkgrel=1
arch=('x86_64')
pkgdesc="A peer-to-peer voting system that ensures voter privacy while preventing double-voting"
url="https://tallyard.xyz"
license=('AGPL3')
depends=('libolm')
makedepends=('go>=1.13')
source=("$pkgname-v$pkgver.tar.gz::https://git.hnitbjorg.xyz/~edwargix/tallyard/archive/v$pkgver.tar.gz")
sha256sums=('80f19e34897bb65e1c4b07e4a4d318e55cf4879008a88d7dc4519d71a95ce668')

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
