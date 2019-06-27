# Maintainer: dekart811

pkgname=bsnes-hd
_gitver=beta8
pkgver=beta8.r0.g2a322e5
pkgrel=1
pkgdesc='Nintendo SNES emulator, featuring HD Mode 7 and Widescreen.'
arch=('x86_64')
url='https://github.com/DerKoun/bsnes-hd'
license=('GPL3')
depends=('alsa-lib' 'cairo' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk2' 'gtksourceview2' 'libao' 'libgl' 'libpulse' 'libx11' 'libxext' 'libxv' 'openal' 'pango' 'sdl' 'libudev.so' 'sdl2')
conflicts=('bsnes' 'bsnes-classic' 'higan-bsnes')
source=(git+https://github.com/DerKoun/bsnes-hd.git)
md5sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/^FOO-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname}"
	git checkout tags/"${_gitver}" -b "${_gitver}"
	# root issue in package
	cd "./bsnes/target-bsnes"
	sed -i "37,38d" GNUmakefile
	sed -i '37s/^.....//' GNUmakefile
}

build() {
	cd "${pkgname}/bsnes"
	make
}

package() {
	cd "${pkgname}/bsnes"
	make prefix="${pkgdir}/usr" install
}
