# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=mpc-qt
pkgver=18.08
pkgrel=1
pkgdesc='A clone of Media Player Classic reimplimented in Qt.'
url='https://github.com/cmdrkotori/mpc-qt'
arch=('x86_64')
license=('GPL2')
depends=('mpv' 'qt5-x11extras')
makedepends=('git' 'qt5-tools')
optdepends=('libva-vdpau-driver: backend for Nvidia and AMD cards'
            'libva-intel-driver: backend for Intel cards'
            'udisks2: to detect available discs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c58fd90926773c9da8bdfc1a8e4dba0b95cbc58cee6db9981e8de94fd9534406')

build() {
  cd "${pkgname}-${pkgver}"
  qmake-qt5 PREFIX=/usr mpc-qt.pro \
    QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
    QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
    QMAKE_LFLAGS_RELEASE="${LDFLAGS}"
  make
}

package() {
  make -C "${pkgname}-${pkgver}" INSTALL_ROOT="${pkgdir}" install
}
