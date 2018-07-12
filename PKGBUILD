## Maintainer: wchurch58

pkgname=pcsx2-emu-fresh
pkgver=1.5.0
pkgrel=1
pkgdesc='A Sony PlayStation 2 emulator'
arch=('x86_64')
url='http://www.pcsx2.net'
license=('GPL2' 'GPL3' 'LGPL2.1' 'LGPL3')
depends=('lib32-glew' 'lib32-libaio' 'lib32-libcanberra' 'lib32-libjpeg-turbo' 'lib32-libpulse'
	'lib32-nvidia-cg-toolkit' 'lib32-portaudio' 'lib32-sdl2' 'lib32-soundtouch' 'lib32-wxgtk2')
makedepends=('cmake' 'git' 'png++')
provides=('pcsx2')
conflicts=('pcsx2')
source=('git+https://github.com/PCSX2/pcsx2.git')
sha256sums=('SKIP')

build() {
mkdir -p pcsx2/build
cd pcsx2/build


cmake .. \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_TOOLCHAIN_FILE=cmake/linux-compiler-i386-multilib.cmake \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_LIBRARY_PATH=/usr/lib32 \
	-DPLUGIN_DIR=/usr/lib32/pcsx2 \
	-DGAMEINDEX_DIR=/usr/lib32/pcsx2 \
	-DEXTRA_PLUGINS=TRUE \
	-DREBUILD_SHADER=TRUE \
	-DGLSL_API=TRUE \
	-DPACKAGE_MODE=TRUE \
	-DXDG_STD=TRUE \
	-DOpenGL_GL_PREFERENCE=GLVND

make -j1
}

package () {
cd pcsx2/build

make DESTDIR="${pkgdir}" install
}

