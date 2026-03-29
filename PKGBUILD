# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=inyokaedit
pkgver=0.28.4
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
sha256sums=('80a87ad01c21d4086acff938d88dd0d6798738df478384e14e4878048ab808dd')

build() {
    cmake -B build-cmake -S "${pkgname}-${pkgver}" \
      -DCMAKE_PREFIX_PATH=/usr/include/qt6 \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DPLUGIN_HIGHLIGHTER=OFF \
      -DPLUGIN_HOTKEY=OFF \
      -DPLUGIN_SPELLCHECKER_HUNSPELL=OFF \
      -DPLUGIN_SPELLCHECKER_NUSPELL=OFF \
      -DPLUGIN_UU_KNOWLEDGEBOX=OFF \
      -DPLUGIN_UU_TABLETEMPLATE=OFF
    cmake --build build-cmake
}

package() {
    DESTDIR="$pkgdir/" cmake --install build-cmake
}
