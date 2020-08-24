# Maintainer: spider-mario <spidermario@free.fr>
pkgname=mtfmapper
pkgver=0.7.30
pkgrel=1
pkgdesc="A utility to produce MTF (modulation transfer function, a measure of edge acuity) maps  of images"
arch=('x86_64')
url="https://sourceforge.net/projects/$pkgname/"
license=('BSD')
depends=('dcraw' 'exiv2' 'gnuplot' 'opencv' 'qt5-charts')
makedepends=('asciidoc' 'cmake' 'eigen' 'tclap' 'subversion')
options=('!makeflags')  # The build process for the documentation is not parallel-safe.
source=("$pkgname::svn+https://svn.code.sf.net/p/$pkgname/code/trunk#revision=645")
b2sums=('SKIP')

build() {
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$pkgname"
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir/" install

	install -Dm644 "$srcdir/$pkgname"/license.txt "$pkgdir"/usr/share/licenses/"$pkgname"/license.txt
}
