pkgname=pguri
pkgver=1.20251029
pkgrel=1
pkgdesc="uri data type for PostgreSQL"
arch=('x86_64')
url="https://github.com/petere/pguri/"
license=('MIT')
makedepends=('clang' 'llvm')
depends=('postgresql>18' 'postgresql<19' 'uriparser')
source=(${url}archive/${pkgver}.tar.gz)
b2sums=('05164943aa011a19000a30e121dacf38447c9639e24d8183f361cf3922428aa5e8a208321ea5b85c948b58e00e9e4949d5f85ae273eb207ffb244cf7d2541899')

build() {
  cd $pkgname-$pkgver

  make CC=clang PG_CPPFLAGS=-Wno-int-conversion
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/pguri/LICENSE"
}
