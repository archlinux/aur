# Maintainer: Juhani Numminen <juhaninumminen0@gmail.com>

pkgname=pentobi
pkgver=13.0
pkgrel=1
pkgdesc="computer opponent for the board game Blokus"
arch=('i686' 'x86_64')
url="https://pentobi.sourceforge.io"
license=('GPL3')
depends=('qt5-base' 'qt5-svg')
makedepends=('cmake' 'extra-cmake-modules' 'kio' 'qt5-tools')
optdepends=('kio: KDE thumbnailer')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
md5sums=('445e5ae98535b87dfabf77cd2a75ce08'
         'SKIP')
validpgpkeys=('CF7C1AEE933D1A03C6D13FF922922BFEEB0F9942') # Markus Enzenberger

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DPENTOBI_BUILD_KDE_THUMBNAILER=ON \
    -DPENTOBI_BUILD_TESTS=ON
  make VERBOSE=1
}

check() {
  cd build
  make test
}

package() {
  cd build
  make DESTDIR="${pkgdir}/" install
}
