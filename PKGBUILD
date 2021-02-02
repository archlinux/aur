# Maintainer: David Florness <david at florness dot com>
pkgname=tallyard
pkgver=0.2.1
pkgrel=2
arch=('x86_64')
pkgdesc="A peer-to-peer voting system that ensures voter privacy while preventing double-voting"
url="https://tallyard.xyz"
license=('AGPL3')
makedepends=('go>=1.11')
source=("https://gitlab.com/edwargix/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('4d550e08654336af91ed007d829bb6b77289c5926e04e0f87a9aa584497ad2dc')

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
