pkgname="xinvaders3d"
pkgver=1.5.0
pkgrel=1
pkgdesc="XInvaders3D is a 3D Vector Graphics Space Invaders clone for X11. "
arch=('i686' 'x86_64')
url="https://github.com/JoesCat/xinvaders3d"
makedepends=('xtrans')
license=('GPL2')
source=(https://github.com/JoesCat/${pkgname}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('a4add5b977129c51635a8b1958026119b169defde017ff33060b77daf7f16a56')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  libtoolize --force
  aclocal
  autoheader
  automake --force-missing --add-missing
  autoconf
  automake -a
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
