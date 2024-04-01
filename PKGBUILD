# Maintainer: Thorsten Roth <elthoro@gmx.de>
pkgname=inyokaedit-plugins
pkgver=0.28.1
pkgrel=2
pkgdesc='Plugins for InyokaEdit'
arch=('i686' 'x86_64')
url='https://github.com/inyokaproject/inyokaedit/'
license=('GPL-3.0-or-later')
makedepends=('qt6-tools')
depends=('qt6-base' 'qt6-webengine' 'hunspell')
optdepends=('inyokaedit: Editor for Inyoka based portals'
            'inyokaedit-data-ubuntuusersde: ubuntuusers.de community files')
source=("inyokaedit-${pkgver}.tar.gz::https://github.com/inyokaproject/inyokaedit/archive/v$pkgver.tar.gz")
sha256sums=('43736876d998368fff7902ff8216483af0cf5c951369ab2300159679c751789f')

build() {   
    cmake -B build-cmake -S "inyokaedit-${pkgver}" \
      -DCMAKE_PREFIX_PATH=/usr/include/qt6 -DQT6=ON \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DBUILD_APPLICATION=OFF \
      -DSPELLCHECKER_NUSPELL=OFF
    cmake --build build-cmake
}

package() {
    DESTDIR="$pkgdir/" cmake --install build-cmake
}
