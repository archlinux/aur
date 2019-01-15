# Maintainer: Sven Hesse <drmccoy@drmccoy.de>

pkgname=xoreos-tools
pkgver=0.0.5.r0.gaed64a2
pkgrel=2
pkgdesc="Tools to help with xoreos development"
arch=('i686' 'x86_64')
url="https://xoreos.org/"
license=('GPL3')
depends=('zlib' 'libxml2' 'boost' 'boost-libs')
makedepends=('git')
source=('git://github.com/xoreos/xoreos-tools.git#tag=v0.0.5')
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
