# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=mpc-qt-git
pkgver=20.10.r8.g81d1b80
pkgrel=1
epoch=1
pkgdesc='A clone of Media Player Classic reimplimented in Qt.'
url='https://github.com/mpc-qt/mpc-qt'
arch=('x86_64')
license=('GPL2')
depends=('mpv' 'qt5-x11extras')
makedepends=('git' 'qt5-tools')
optdepends=('libva-vdpau-driver: backend for Nvidia and AMD cards'
            'libva-intel-driver: backend for Intel cards'
            'udisks2: to detect available discs')
provides=('mpc-qt')
conflicts=('mpc-qt')
source=("mpc-qt::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd mpc-qt
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd mpc-qt
  qmake-qt5 PREFIX=/usr mpc-qt.pro \
    QMAKE_CFLAGS_RELEASE="${CFLAGS}" \
    QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
    QMAKE_LFLAGS_RELEASE="${LDFLAGS}"
  make
}

package() {
  make -C mpc-qt INSTALL_ROOT="${pkgdir}" install
}
