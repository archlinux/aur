# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# AutoTrace compiled without ImageMagick dependency

_srcname="autotrace"
pkgname=autotrace-nomagick
pkgver=0.31.1
pkgrel=1
pkgdesc="A program for converting bitmap to vector graphics (no ImageMagick dependency)"
arch=('i686' 'x86_64')
url="http://autotrace.sourceforge.net/"
license=('GPL2' 'LGPL2.1')
depends=('ming' 'pstoedit-nomagick')
provides=('autotrace' 'libautotrace.so')
conflicts=('autotrace')
source=("http://sourceforge.net/projects/autotrace/files/AutoTrace/${pkgver}/${_srcname}-${pkgver}.tar.gz"
        "http://www.openmamba.org/pub/openmamba/devel/patches/autotrace-0.31.1-libpng-1.5.patch")
# Alternative site to download libpng 1.5+ patch:
# https://github.com/PhantomX/slackbuilds/raw/master/autotrace/patches/autotrace-0.31.1-libpng-1.5.patch
sha256sums=('5a1a923c3335dfd7cbcccb2bbd4cc3d68cafe7713686a2f46a1591ed8a92aff6'
            'e9461fc983a9cd7832b3fe953934ea81a76afa473b748a5ac1c5e91c932717d4')

prepare() {
	cd "$_srcname"-"$pkgver"
	patch < "${srcdir}/autotrace-0.31.1-libpng-1.5.patch"
}

build() {
	cd "$_srcname"-"$pkgver"

	./configure \
                --prefix=/usr \
                --mandir=/usr/share \
                --enable-static=no \
                --enable-shared=yes \
                --without-magick \
                --with-pstoedit
	make
}

package() {
	cd "$_srcname"-"$pkgver"
	make DESTDIR="$pkgdir/" install
	
}
