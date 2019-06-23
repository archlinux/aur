# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=daggy
pkgver=1.1.2
pkgrel=1
pkgdesc='Run multiple commands on remote servers simultaneously and save output locally'
arch=('x86_64')
depends=('qt5-base' 'botan' 'yaml-cpp')
license=('MIT')
url='https://docs.daggy.dev/'
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/synacker/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('71beb21b18384ebee44ae39b39ec6edfe906232618d98ece3eaaa91e886d493c')

build() {
  cd "${pkgname}-${pkgver}"
  qmake-qt5 BINDIR="${pkgdir}/usr/bin" LIBDIR="{pkgdir}/usr/lib" VERSION="${pkgver}" BUILD_NUMBER=0 CONFIG+=release
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make install

  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING "ssh/LICENSE.GPL3-EXCEPT.txt"
}
