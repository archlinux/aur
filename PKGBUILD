# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=inyokaedit-plugins
pkgver=0.28.4
pkgrel=1
pkgdesc='Plugins for InyokaEdit'
arch=('i686' 'x86_64')
url='https://github.com/inyokaproject/inyokaedit/'
license=('GPL-3.0-or-later')
makedepends=('qt6-tools')
depends=('qt6-base' 'qt6-webengine' 'hunspell')
optdepends=('inyokaedit: Editor for Inyoka based portals'
            'inyokaedit-data-ubuntuusersde: ubuntuusers.de community files')
source=("inyokaedit-${pkgver}.tar.gz::https://github.com/inyokaproject/inyokaedit/archive/v$pkgver.tar.gz")
sha256sums=('80a87ad01c21d4086acff938d88dd0d6798738df478384e14e4878048ab808dd')

build() {   
    cmake -B build-cmake -S "inyokaedit-${pkgver}" \
      -DCMAKE_PREFIX_PATH=/usr/include/qt6 \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DINY_BUILD_APPLICATION=OFF \
      -DPLUGIN_SPELLCHECKER_NUSPELL=OFF
    cmake --build build-cmake
}

package() {
    DESTDIR="$pkgdir/" cmake --install build-cmake
}
