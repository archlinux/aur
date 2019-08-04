# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=daggy
pkgver=1.1.3
pkgrel=1
pkgdesc='Run multiple commands on remote servers simultaneously and save output locally'
arch=('x86_64')
depends=('qt5-base' 'botan' 'yaml-cpp')
license=('MIT')
url='https://docs.daggy.dev/'
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/synacker/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('559a9d7916988edf67be50625d89b38c311edaa322c3238e0107883dc315f0c6')

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
