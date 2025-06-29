# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=inyokaedit
pkgver=0.28.3
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
sha256sums=('1d770e75e544c4fc2d0068d7d163330196e542c58777ca7cc7dc9d3bb147bc1b')

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
