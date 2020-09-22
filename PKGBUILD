# Maintainer: Vincent von Schelm <aur at vncnt dot eu>

pkgbase=rnablueprint
pkgname=('rnablueprint' 'python-rnablueprint' 'perl-rnablueprint')
pkgName=('RNAblueprint')
pkgver=1.3.0
pkgrel=1
pkgdesc="Library for uniform sampling of RNA sequences given structural and sequence constraints."
arch=('x86_64')
url="https://github.com/ViennaRNA/RNAblueprint/"
license=('GPL3')
groups=('viennarna-package')
makedepends=('boost'
             'swig' 
             'perl'
             'python')
source=("https://github.com/ViennaRNA/RNAblueprint/releases/download/${pkgver}/RNAblueprint-${pkgver}.tar.gz")
md5sums=('440a11074144bea78ec8e1dcb6a096f3')
sha1sums=('0596ea7f846cea0a72eaaefd2c9a9c86464cfc4a')
sha256sums=('f59015f75afc6e2d0637dec24d91918bc59af2b60c11dcf1e25adc824eb13a75')

prepare() {
	cd "$srcdir/$pkgName-$pkgver"
}

build() {
	cd "$srcdir/$pkgName-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgName-$pkgver"
	make -k check
}

package_rnablueprint() {
  depends=('boost-libs')
  provides=("libRNAblueprint.so=${pkgver}")
  
	cd "$srcdir/$pkgName-$pkgver"
	
	cd src
	make DESTDIR="$pkgdir" install
	cd ../lib
	make DESTDIR="$pkgdir" install
	
}

package_python-rnablueprint() {
  depends=('python' rnablueprint="${pkgver}")
  cd "$srcdir/$pkgName-$pkgver"
	cd interfaces/Python
	make DESTDIR="$pkgdir" install
}

package_perl-rnablueprint() {
  depends=('perl' rnablueprint="${pkgver}")
  cd "$srcdir/$pkgName-$pkgver"
	cd interfaces/Perl
	make DESTDIR="$pkgdir" install
}
