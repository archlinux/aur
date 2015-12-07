# Maintainer: Fredrik Strandin <fredrik@strandin.name>

pkgname=libminizinc
pkgver=2.0.9
pkgrel=1
pkgdesc="MiniZinc is a modelling language for constraint programming problems"
arch=(i686 x86_64)
url="http://www.minizinc.org/"
makedepends=(cmake)
license=('MPL2')
conflicts=(minizinc-bin)
provides=(minizinc)
source=(https://github.com/MiniZinc/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('35c15909bd1ebbf24ba571f1b9d96ba83c3e0e0e362b7eac071bfab0ea2b8a6e')

build() {
  cd ${pkgname}-${pkgver}

  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR=$pkgdir install

  # libminizincs cmake-file installs files in public folders when they should
  # actuall go into their own to not raise conflicts.
  install -d -m755 ${pkgdir}/usr/share/doc/${pkgname}
  mv ${pkgdir}/usr/{INSTALL,README}.txt \
    ${pkgdir}/usr/doc/pdf \
    ${pkgdir}/usr/share/examples \
    ${pkgdir}/usr/share/doc/${pkgname}/
  rm -rf ${pkgdir}/usr/doc

  install -d -m755 ${pkgdir}/usr/share/licenses/${pkgname}
  mv ${pkgdir}/usr/LICENSE.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/
}

# vim:set ts=2 sw=2 et:
