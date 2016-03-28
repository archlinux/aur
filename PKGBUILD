# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=libraqm-git
pkgver=v0.1.0.r25.gf45042d
pkgrel=1
pkgdesc="A library that encapsulates the logic for complex text layout"
arch=('i686' 'x86_64')
url="https://github.com/HOST-Oman/libraqm"
license=('custom')
depends=('freetype2' 'harfbuzz' 'fribidi')
makedepends=('gtk-doc')
provides=('libraqm' 'libraqm.so')
conflicts=('libraqm')
source=("$pkgname"::'git+https://github.com/HOST-Oman/libraqm.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	
	# Git, with or without tags available
	# Using the most recent un-annotated tag reachable from the last commit: 
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
	  
}

build() {
	cd "${srcdir}/${pkgname}"
	
	./autogen.sh
	
	./configure \
	        --prefix=/usr \
	        --enable-static=no \
	        --enable-shared=yes \
	        --enable-fast-install=yes \
	        --enable-gtk-doc=yes \
	        --enable-gtk-doc-html=yes \
	        --enable-gtk-doc-pdf=no
	
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	
	make DESTDIR="$pkgdir/" install
	
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
