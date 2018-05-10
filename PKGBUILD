# Maintainer: E5ten

pkgname=lumina-screenshot
_pkgver=1.4.0-p1
pkgver=1.4.0p1
pkgrel=1
pkgdesc="Screenshot tool for the lumina desktop environment"
arch=('x86_64')
url='https://github.com/trueos/lumina'
license=('BSD')
depends=()
makedepends=('qt5-base' 'qt5-svg' 'qt5-tools')
conflicts=("lumina-desktop" "lumina-desktop-git" "insight-fm")
provides=("lumina-screenshot")
source=("https://github.com/trueos/lumina/archive/v${_pkgver}.tar.gz")
sha512sums=('340079832f4f6c9c9c70f11d7743b7c7db6772897f6411a966bf2bd77124bab1fbac8f5751164fb8a08a12c4443f515aaee76b117b4f959263eeaa98dbcbe41e')

build() {
    cd "${srcdir}/lumina-${_pkgver}/src-qt5/desktop-utils/lumina-screenshot"
    find "${srcdir}/${pkgfullname}" -name *.desktop -exec sed -i 's/usr\/local/usr/' {} \;
    qmake QMAKE_CFLAGS_ISYSTEM= PREFIX="/usr" LIBPREFIX=/usr/lib QT5LIBDIR=/usr/lib/qt CONFIG+=WITH_I18N L_MANDIR=/usr/share/man L_ETCDIR="/etc"
    make
}

package() {
    cd "${srcdir}/lumina-${_pkgver}/src-qt5/desktop-utils/lumina-screenshot"
    make INSTALL_ROOT="${pkgdir}" install
}