# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=mpc-qt
pkgver=17.11
pkgrel=1
pkgdesc='A clone of Media Player Classic reimplimented in Qt.'
url='https://github.com/cmdrkotori/mpc-qt'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('mpv' 'qt5-x11extras')
makedepends=('git' 'qt5-tools')
optdepends=('adobe-source-sans-pro-fonts: default font for mpv-stats script'
            'libva-vdpau-driver: backend for Nvidia and AMD cards'
            'libva-intel-driver: backend for Intel cards')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd mpc-qt
  git submodule update --init --recursive
}

build() {
  cd mpc-qt
  qmake-qt5 PREFIX=/usr mpc-qt.pro
  make
}

package() {
  make -C mpc-qt INSTALL_ROOT="${pkgdir}" install
}
