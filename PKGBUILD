# Maintainer: Gianluca Montecchi <gian@grys.it>

pkgname=bulbcalculator
_pkgname=bulbcalculator
pkgver=2.2.0
pkgrel=1
pkgdesc="A progran to design bulbs of sailboat based on Qt and libQGLViewer"
url="http://bulbcalculator.wordpress.org"
depends=('qt5-base' 'libqglviewer')
install=bulbcalculator.install
arch=('i686' 'x86_64')
license=('GPL3')
source=("http://grys.it/BulbCalculator/${_pkgname}-src-${pkgver}.tar.gz" "bulbcalculator.desktop")

md5sums=('01c4f35f3f8cfd5694d47ea1e18a2723' '02dc7515355a97830c2796c7b86614dc')

build()
{
  cd ${_pkgname}-$pkgver

  qmake -o Makefile ${_pkgname}.pro || return 1
  make \
    CFLAGS="-pipe ${CFLAGS} -D_REENTRANT -Wall -W -fPIC \$(DEFINES)" \
    CXXFLAGS="-pipe ${CXXFLAGS} -D_REENTRANT -Wall -W -fPIC \$(DEFINES)" || return 1
}

package()
{
  cd ${_pkgname}-$pkgver

  make install INSTALL_ROOT="$pkgdir" || return 1
  
  # Install license.
  install -d -m 0755 "${pkgdir}"/usr/share/licenses/$pkgname/ || return 1
  install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 share/images/bulbcalculator.png \
    "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/bulbcalculator.png
  #install -m 0644 LICENCE GPL_EXCEPTION "${pkgdir}"/usr/share/licenses/$pkgname/ || return 1
}
