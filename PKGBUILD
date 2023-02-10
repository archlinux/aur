# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=mpc-qt
pkgver=23.02
pkgrel=1
pkgdesc='A clone of Media Player Classic reimplemented in Qt.'
url='https://github.com/mpc-qt/mpc-qt'
arch=('x86_64')
license=('GPL2')
depends=('mpv' 'qt5-x11extras')
makedepends=('git' 'qt5-tools')
optdepends=('libva-vdpau-driver: backend for Nvidia and AMD cards'
            'libva-intel-driver: backend for Intel cards'
            'udisks2: to detect available discs')
source=("mpc-qt-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c7bb48e53cf43e6705e67ae7de598d50f442ea73131d17142ea027042befd14c')

build() {
  cd "mpc-qt-${pkgver}"
  qmake-qt5 "MPCQT_VERSION=${pkgver}" PREFIX=/usr mpc-qt.pro \
    QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
    QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
    QMAKE_LFLAGS_RELEASE="${LDFLAGS}"
  make
}

package() {
  make -C "mpc-qt-${pkgver}" INSTALL_ROOT="${pkgdir}" install
}
