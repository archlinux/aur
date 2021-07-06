# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=mpc-qt
pkgver=20.10
pkgrel=2
pkgdesc='A clone of Media Player Classic reimplimented in Qt.'
url='https://github.com/mpc-qt/mpc-qt'
arch=('x86_64')
license=('GPL2')
depends=('mpv' 'qt5-x11extras')
makedepends=('git' 'qt5-tools')
optdepends=('libva-vdpau-driver: backend for Nvidia and AMD cards'
            'libva-intel-driver: backend for Intel cards'
            'udisks2: to detect available discs')
source=("mpc-qt-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9351d4ce6e098c79e0ff167accc32a22a77f0f4f933e965a4882ee8a37fa5df6')

build() {
  cd "mpc-qt-${pkgver}"
  qmake-qt5 PREFIX=/usr mpc-qt.pro \
    QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
    QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
    QMAKE_LFLAGS_RELEASE="${LDFLAGS}"
  make
}

package() {
  make -C "mpc-qt-${pkgver}" INSTALL_ROOT="${pkgdir}" install
}
