# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=mpc-qt
pkgver=19.06.g2abe6e7f
pkgrel=1
_commit=2abe6e7fc643068d50522468fe75d614861555ad
pkgdesc='A clone of Media Player Classic reimplimented in Qt.'
url='https://gitlab.com/mpc-qt/mpc-qt'
arch=('x86_64')
license=('GPL2')
depends=('mpv' 'qt5-x11extras')
makedepends=('git' 'qt5-tools')
optdepends=('libva-vdpau-driver: backend for Nvidia and AMD cards'
            'libva-intel-driver: backend for Intel cards'
            'udisks2: to detect available discs')
source=("${pkgname}-${pkgver}.tar.bz2::${url}/-/archive/${_commit}/${pkgname}-${_commit}.tar.bz2")
sha256sums=('2d1b1dfbd73123a93461ee98176d5b405c63b2d89021566ff025dda9c016998c')

build() {
  cd "${pkgname}-${_commit}"
  qmake-qt5 PREFIX=/usr mpc-qt.pro \
    QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
    QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
    QMAKE_LFLAGS_RELEASE="${LDFLAGS}"
  make
}

package() {
  make -C "${pkgname}-${_commit}" INSTALL_ROOT="${pkgdir}" install
}
