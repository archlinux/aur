# Maintainer: Sven Hesse <drmccoy@drmccoy.de>

pkgname=xoreos
pkgver=0.0.6.r0.g4f612dbdc
pkgrel=1
pkgdesc="A reimplementation of BioWare's Aurora engine"
arch=('i686' 'x86_64')
url="https://xoreos.org/"
license=('GPL3')
depends=('zlib' 'xz' 'libxml2' 'boost' 'boost-libs' 'sdl2' 'freetype2' 'openal' 'libmad' 'libogg' 'libvorbis' 'faad2' 'xvidcore' 'libvpx')
makedepends=('git')
source=('git://github.com/xoreos/xoreos.git#tag=v0.0.6')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"

	git describe --long --match desc/\* | cut -d '/' -f 2- | sed -e 's/\(.*\)-\([^-]*\)-\([^-]*\)/\1.r\2.\3/'
}

build() {
	cd "$srcdir/$pkgname"

	./autogen.sh
	./configure --with-release=AUR --with-lto --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"

	make DESTDIR="$pkgdir/" install
}
