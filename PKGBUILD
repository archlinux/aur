# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=bertini_real
pkgver=1.0.0
pkgrel=2
pkgdesc="Numerical decomposition of real algebraic sets, based on the Bertini homotopy continuation solver"
url="http://www.bertinireal.com/"
arch=('i686' 'x86_64')
license=('custom: Bertini license')
depends=('bertini' 'boost' 'gmp' 'mpfr')
optdepends=('openmpi')
source=("http://www.bertinireal.com/resources/${pkgname}-${pkgver}.tar.gz"
        "http://bertini.nd.edu/Bertini_License")
md5sums=('5be3953d6fab005626f6ce81e03893be'
         'SKIP')

build () {
  cd ${srcdir}/${pkgname}-${pkgver}
  CPPFLAGS="$CPPFLAGS -I/usr/include/bertini"
  ./configure --prefix=/usr CPPFLAGS="$CPPFLAGS" --includedir=/usr/include/bertini_real
  make
}

package() {
  cd ${srcdir}
  install -D -m644 Bertini_License -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
