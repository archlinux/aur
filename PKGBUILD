# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=nxengine-evo
pkgver=2.6.5.1
_ver=2.6.5-1
pkgrel=1
pkgdesc="A somewhat upgraded/refactored version of nxengine"
arch=('i686' 'x86_64')
url="https://github.com/isage/nxengine-evo"
license=('GPL3')
depends=(sdl2_mixer sdl2_image sdl2_ttf)
makedepends=(cmake libpng libjpeg)
source=("https://github.com/isage/nxengine-evo/archive/v${_ver}.tar.gz"
        "https://www.cavestory.org/downloads/cavestoryen.zip")
sha256sums=('db9b78b0c4005959ab8f3a6a05c02d86e764e6593cdd11a2178c581bb03a0699'
            'aa87fa30bee9b4980640c7e104791354e0f1f6411ee0d45a70af70046aa0685f')

build() {
	cd "${pkgname}-${_ver}"
	mkdir build
	cd build
    cmake -DCMAKE_BUILD_TYPE=None -Wno-dev ..
    make

	cd ../
    cp -r "../CaveStory/data/" "./"
    cp "../CaveStory/Doukutsu.exe" "./"
  
    ./build/nxextract
}

package() {
	cd "${pkgname}-${_ver}/build"
	make DESTDIR="$pkgdir" install
}
