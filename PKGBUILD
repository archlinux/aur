# Maintainer: Fredrik Strandin <fredrik@strandin.name>

pkgname=libminizinc
pkgver=2.0.5
pkgrel=1
pkgdesc="MiniZinc is a modelling language for constraint programming problems"
arch=(i686 x86_64)
url="http://www.minizinc.org/"
makedepends=(cmake)
license=('MPL2')
conflicts=(minizinc-bin)
provides=(minizinc)
source=(https://github.com/MiniZinc/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('eaa73156bdcd884b2258d14fb873155b')
sha256sums=('1ebba63e30d79d7e26fa771ddfd14d485db7de37a677115a26063c8ab546a2f3')

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
