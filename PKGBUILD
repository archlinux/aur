## Maintainer: wchurch58

pkgname=pcsxr-pgxp-emu-fresh
pkgver=1.9.94
pkgrel=1
pkgdesc='A Sony PlayStation (PSX) emulator based on the PCSX-df Project with Parallel/Precision Geometry Transform Pipeline'
arch=('x86_64')
url='http://ngemu.com/threads/pcsxr-pgxp.186369/'
license=('GPL')
depends=('ffmpeg' 'gtk3' 'libarchive' 'libcdio' 'libxv' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
 'libgl' 'libpulse' 'libx11' 'libxext' 'libxtst' 'libxv' 'libxxf86vm' 'sdl2' 'zlib' 'nasm'
 'libepoxy')
makedepends=('cmake' 'git' 'intltool' 'mesa' 'libgl' 'libepoxy')
provides=('pcsxr')
conflicts=('pcsxr')
source=('pcsxr::git+https://github.com/icatbutler/pcsxr.git')
md5sums=('SKIP')

build() {
mkdir -p pcsxr/build
cd pcsxr/build

cmake .. \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_INSTALL_LIBDIR=/usr/lib \
	-DSND_BACKEND=sdl \
	-DENABLE_CCDDA=ON \
	-DUSE_LIBARCHIVE=ON \
	-DUSE_LIBCDIO=ON \
	-DOpenGL_GL_PREFERENCE=GLVND

 make -j1
}

package() {
cd pcsxr/build

make DESTDIR="${pkgdir}" install
}
