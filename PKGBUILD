# Maintainer: Juhani Numminen <juhaninumminen0@gmail.com>

pkgname=pentobi
pkgver=17.3
pkgrel=1
pkgdesc="computer opponent for the board game Blokus"
arch=('x86_64')
url="https://pentobi.sourceforge.io"
license=('GPL3')
depends=('qt5-base' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-webview')
makedepends=('appstream' 'cmake' 'docbook-xsl' 'extra-cmake-modules'
             'itstool' 'kio' 'qt5-tools')
optdepends=('kio: KDE thumbnailer')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
md5sums=('e68a44af164f9af02ff4cababd89625c'
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
    -DBUILD_TESTING=ON \
    -DDOCBOOKXSL_DIR=/usr/share/xml/docbook/xsl-stylesheets-1.79.2
  make
}

check() {
  cd build
  make test
}

package() {
  cd build
  make DESTDIR="${pkgdir}/" install
}
