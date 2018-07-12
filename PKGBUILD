# Maintainer: wchurch58

pkgname=citra-emu-fresh
pkgver=401
pkgrel=1
pkgdesc='An experimental open-source Nintendo 3DS emulator/debugger'
arch=('i686' 'x86_64')
url='http://www.github.com/citra-emu/citra/'
license=('GPL2')
makedepends=('git' 'cmake' 'sdl2' 'qt5-base' 'shared-mime-info' 'desktop-file-utils' 'boost')
source=('citra::git+https://github.com/citra-emu/citra.git')
sha256sums=('SKIP')

build() {

mkdir -p citra/build
cd citra

git submodule update --init --recursive
cd build

cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=/usr/lib ..
make -j1
}

package() {
cd citra/build

mkdir -p "${pkgdir}/opt/citra"

make DESTDIR="${pkgdir}" install
}
