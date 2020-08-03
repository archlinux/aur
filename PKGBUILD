# Maintainer: Sven Hesse <drmccoy@drmccoy.de>

pkgname=phaethon
pkgver=0.0.6.r0.gd51692a
pkgrel=1
pkgdesc="A resource explorer for BioWare's Aurora engine games"
arch=('i686' 'x86_64')
url="https://xoreos.org/"
license=('GPL3')
depends=('zlib' 'xz' 'boost' 'boost-libs' 'openal' 'libmad' 'libogg' 'libvorbis' 'faad2' 'xvidcore' 'qt5-base')
makedepends=('git')
source=('git://github.com/xoreos/phaethon.git#tag=v0.0.6')
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
