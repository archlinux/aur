# Maintainer: dekart811

pkgname=bsnes-hd
_gitver=beta10
pkgver=beta10.r0.g917673f
pkgrel=1
pkgdesc='Nintendo SNES emulator, featuring HD Mode 7 and Widescreen.'
arch=('x86_64')
url='https://github.com/DerKoun/bsnes-hd'
license=('GPL3')
depends=('alsa-lib' 'cairo' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk2' 'gtksourceview2' 'libao' 'libgl' 'libpulse' 'libx11' 'libxext' 'libxv' 'openal' 'pango' 'sdl' 'libudev.so' 'sdl2')
makedepends=('git')
conflicts=('bsnes' 'bsnes-classic' 'higan-bsnes')
source=(git+https://github.com/DerKoun/bsnes-hd.git)
md5sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/^FOO-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cp "../${pkgname}.patch" "${pkgname}/"
	cd "${pkgname}"
	git checkout tags/"${_gitver}" -b "${_gitver}"
	# fix root issue in package
	git apply "${pkgname}.patch"
}

build() {
	cd "${pkgname}/bsnes"
	make
}

package() {
	cd "${pkgname}/bsnes"
	make prefix="${pkgdir}/usr" install
}
