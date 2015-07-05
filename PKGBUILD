# Maintainer: Vincent Hourdin <aur at vinvin dot tf>
pkgname=mdesign
pkgver=1.2
pkgrel=1
pkgdesc="Aerofoil design software based on Panel2D with considerable enhancements."
url="http://sourceforge.net/projects/mdesign/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('fltk')
optdepends=('gifsicle: viewing iteration data')
source=("http://sourceforge.net/projects/mdesign/files/MDesign-${pkgver}.tar.gz")
sha1sums=('649ebce0bd7f475c7b678ab1cac20a67292d82de')

build() {
	cd "${srcdir}/MDesign"
	aclocal
	autoconf
	automake --add-missing
	LDFLAGS=-lX11 ./configure
	make
}

package() {
	# TODO: install the MDesign script described in build.sh instead of the real binary
	cd "${srcdir}/MDesign"
	/usr/bin/install -D src/MDesign "${pkgdir}/usr/bin/MDesign"
}

