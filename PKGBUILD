# Maintainer: Juhani Numminen <juhaninumminen0@gmail.com>

pkgname=pentobi
pkgver=10.1
pkgrel=1
pkgdesc="computer opponent for the board game Blokus"
arch=('i686' 'x86_64')
url="http://pentobi.sourceforge.net"
license=('GPL3')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'qt5-base' 'qt5-svg'
         'shared-mime-info')
makedepends=('cmake' 'extra-cmake-modules' 'kio' 'qt5-tools')
optdepends=('kio: KDE thumbnailer')
install=${pkgname}.install
source=("http://dl.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('5e797aac5a7fd365efc15c5c04468cedea7f4e60e4ec7d90e30d8930e70d9cda')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT5=ON \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DPENTOBI_BUILD_KDE_THUMBNAILER=ON
  make VERBOSE=1
}

package() {
  cd build
  make DESTDIR="${pkgdir}/" install
}
