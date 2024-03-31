# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=inyokaedit
pkgver=0.28.0
pkgrel=1
pkgdesc='Editor for Inyoka based portals'
arch=('i686' 'x86_64')
url='https://github.com/inyokaproject/inyokaedit/'
license=('GPL-3.0-or-later')
makedepends=('cmake' 'qt6-tools')
depends=('qt6-base' 'qt6-webengine' 'hicolor-icon-theme')
optdepends=('inyokaedit-plugins: Plugins for InyokaEdit'
            'inyokaedit-data-ubuntuusersde: ubuntuusers.de community files')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/inyokaproject/inyokaedit/archive/v$pkgver.tar.gz")
sha256sums=('2b68f58552e6b947255289bab1712d1f7dc53abdd286cdc6146aabe828a0d8cd')

build() {
    cmake -B build-cmake -S "${pkgname}-${pkgver}" \
      -DCMAKE_PREFIX_PATH=/usr/include/qt6 -DQT6=ON \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DHIGHLIGHTER=OFF \
      -DHOTKEY=OFF \
      -DSPELLCHECKER_HUNSPELL=OFF \
      -DSPELLCHECKER_NUSPELL=OFF \
      -DUU_KNOWLEDGEBOX=OFF \
      -DUU_TABLETEMPLATE=OFF
    cmake --build build-cmake
}

package() {
    DESTDIR="$pkgdir/" cmake --install build-cmake
}
