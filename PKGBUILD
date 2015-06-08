# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=libbitcoin
pkgver=2.8.0
pkgrel=3
pkgdesc="asynchronous C++ library for Bitcoin"
arch=('i686' 'x86_64')
url="https://github.com/libbitcoin/libbitcoin/"
license=('AGPL')
depends=('boost' 'openssl' 'curl' 'icu')
# currently we need the git version of this library because the non-git version
# does not package the pkg-config file which this package expects
depends+=('secp256k1-git')
makedepends=()
source=( "$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz" )
sha256sums=('47753bc3723d89e2ff4856a481429cdffd8a13f6870f66a495d5a6db4239d191')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf -i
  ./configure --prefix="/usr/" --with-icu
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
