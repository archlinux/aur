# Maintainer: Vincent Hourdin <aur at vinvin dot tf>
pkgname=mdesign
pkgver=1.2.2
pkgrel=1
pkgdesc="Aerofoil design software based on Panel2D with considerable enhancements."
url="http://sourceforge.net/projects/mdesign/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('fltk')
optdepends=('gifsicle: viewing iteration data')
source=("http://sourceforge.net/projects/mdesign/files/MDesign-${pkgver}.tar.gz")
sha1sums=('a798a02e935ba11ded804f9adf3a1daf100e7f93')

build() {
	cd "${srcdir}/MDesign-${pkgver}"
	aclocal
	autoconf
	automake --add-missing
	LDFLAGS=-lX11 ./configure
	make
}

package() {
	# TODO: install the MDesign script described in build.sh instead of the real binary
	cd "${srcdir}/MDesign-${pkgver}"
	/usr/bin/install -D src/MDesign "${pkgdir}/usr/bin/MDesign"
}

