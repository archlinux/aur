# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=mpc-qt-git
pkgver=17.08.r13.gaf00b5b
pkgrel=1
pkgdesc='A clone of Media Player Classic reimplimented in Qt.'
url='https://github.com/cmdrkotori/mpc-qt'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('mpv' 'qt5-x11extras')
makedepends=('git' 'qt5-tools')
optdepends=('libva-vdpau-driver: backend for Nvidia and AMD cards'
            'libva-intel-driver: backend for Intel cards')
provides=('mpc-qt')
conflicts=('mpc-qt')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd mpc-qt
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

prepare() {
  cd mpc-qt
  git submodule init
  git submodule update
}

build() {
  cd mpc-qt
  qmake-qt5 PREFIX=/usr mpc-qt.pro
  make
}

package() {
  make -C mpc-qt INSTALL_ROOT="${pkgdir}" install
}
