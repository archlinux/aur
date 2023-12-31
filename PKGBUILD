# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=mpc-qt
pkgver=23.12
pkgrel=1
pkgdesc='A clone of Media Player Classic reimplemented in Qt.'
url='https://github.com/mpc-qt/mpc-qt'
arch=('x86_64')
license=('GPL2')
depends=('mpv' 'qt6-svg')
makedepends=('git' 'qt6-tools')
optdepends=('libva-vdpau-driver: backend for Nvidia and AMD cards'
            'libva-intel-driver: backend for Intel cards'
            'udisks2: to detect available discs')
source=("mpc-qt-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6a639bc7911a8972cb7d7e207d3cb24606d2439af2665c373745ae8a6ced65be')

build() {
  cd "mpc-qt-${pkgver}"
  qmake6 "MPCQT_VERSION=${pkgver}" PREFIX=/usr mpc-qt.pro \
    QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
    QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
    QMAKE_LFLAGS_RELEASE="${LDFLAGS}"
  make
}

package() {
  make -C "mpc-qt-${pkgver}" INSTALL_ROOT="${pkgdir}" install
}
