# Maintainer: Juhani Numminen <juhaninumminen0@gmail.com>

pkgname=pentobi
pkgver=9.0
pkgrel=2
pkgdesc="computer opponent for the board game Blokus"
arch=('i686' 'x86_64')
url="http://pentobi.sourceforge.net"
license=('GPL3')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'qt4'
         'shared-mime-info')
makedepends=('automoc4' 'cmake' 'kdelibs')
optdepends=('kdelibs: KDE thumbnailer')
install=${pkgname}.install
source=("http://dl.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('29d76f5e360c4a89dd2384c6e15eb38e6858122b680589129959785f9e7668f2')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPENTOBI_BUILD_KDE_THUMBNAILER=ON
  make VERBOSE=1
}

package() {
  cd build
  make DESTDIR="${pkgdir}/" install
}
