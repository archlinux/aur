# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=inyokaedit
pkgver=0.28.2
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
sha256sums=('9aa40853ea658bc1b026a4f937ce415c397ecce59d2b45722b8f25aeb7d83037')

build() {
    cmake -B build-cmake -S "${pkgname}-${pkgver}" \
      -DCMAKE_PREFIX_PATH=/usr/include/qt6 \
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
