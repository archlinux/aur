pkgname=libcurve
pkgver=r80.dd7bba9
pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="implements the CurveZMQ elliptic curve security mechanism, for use in ZeroMQ applications"
arch=('i686' 'x86_64')
url="https://github.com/zeromq/libcurve"
license=('MPL2')
depends=('czmq>=3.0' 'czmq<4.0')
makedepends=()
source=("git://github.com/zeromq/libcurve.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make $MAKEFLAGS
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}
