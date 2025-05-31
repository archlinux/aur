# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=mpc-qt-git
pkgver=24.12.r394.g9112eac
pkgrel=1
epoch=1
pkgdesc='A clone of Media Player Classic reimplemented in Qt.'
url='https://github.com/mpc-qt/mpc-qt'
arch=('x86_64')
license=('GPL-2.0-only')
depends=('mpv' 'qt6-svg')
makedepends=('boost' 'cmake' 'git' 'qt6-tools')
optdepends=('libva-intel-driver: backend for Intel cards'
            'udisks2: to detect available discs')
provides=('mpc-qt')
conflicts=('mpc-qt')
source=("mpc-qt::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd mpc-qt
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g;s/.master//g'
}

build() {
  cmake -B build -S mpc-qt \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMPCQT_VERSION="${pkgver}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
