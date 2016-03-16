# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=bertini
pkgver=1.5
pkgrel=2
pkgdesc="Homotopy continuation solver for systems of polynomial equations"
url="http://bertini.nd.edu/"
arch=('i686' 'x86_64')
license=('custom: Bertini license')
depends=('boost' 'gmp' 'mpfr')
optdepends=('openmpi: multithreading support')
source=("http://bertini.nd.edu/BertiniSource_v${pkgver}.tar.gz")
sha256sums=('a9a68a96e180fe6a93ba1bc1d61f522784c9a053b049b2cbd98008b5b6deec3c')

prepare () {
  cd ${srcdir}/BertiniSource_v${pkgver}
  rm aclocal.m4 Makefile.in
  aclocal
  automake --add-missing
  autoconf
}

build () {
  cd ${srcdir}/BertiniSource_v${pkgver}
  ./configure --prefix=/usr --includedir=/usr/include/bertini
  make
}

package() {
  cd ${srcdir}/BertiniSource_v${pkgver}
  install -D -m644 Bertini_License -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D -m644 BertiniUsersManual.pdf "${pkgdir}/usr/share/doc/${pkgname}/BertiniUsersManual.pdf"
  make DESTDIR="${pkgdir}" install
}
