# Maintainer: Vincent von Schelm <aur at vncnt dot eu>

pkgbase=rnablueprint
pkgname=('rnablueprint' 'python-rnablueprint' 'python2-rnablueprint' 'perl-rnablueprint')
pkgName=('RNAblueprint')
pkgver=1.3.2
pkgrel=3
pkgdesc="Library for uniform sampling of RNA sequences given structural and sequence constraints."
arch=('x86_64')
url="https://github.com/ViennaRNA/RNAblueprint/"
license=('GPL3')
groups=('viennarna-package')
makedepends=('boost'
             'swig' 
             'perl'
             'python'
             'python2')
source=("$pkgname-${pkgver}.tar.gz::https://github.com/ViennaRNA/RNAblueprint/archive/${pkgver}.tar.gz")
md5sums=('c917c2d8eed51a12dc0d2b702147dc69')
sha1sums=('766d666f5cfa5294881b672b95fc4c777e9c4d40')
sha256sums=('6268a6c63f9159011ea09b9b24065ca99f54a1c5cbc211a8e6dcd340efab9fb8')

prepare() {
	cd "$srcdir/$pkgName-$pkgver"
	./autogen.sh
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
	cd interfaces/Python3
	make DESTDIR="$pkgdir" install
}

package_python2-rnablueprint() {
  depends=('python2' rnablueprint="${pkgver}")
  cd "$srcdir/$pkgName-$pkgver"
	cd interfaces/Python2
	make DESTDIR="$pkgdir" install
}

package_perl-rnablueprint() {
  depends=("perl>=5.23.0-3" rnablueprint="${pkgver}")
  cd "$srcdir/$pkgName-$pkgver"
	cd interfaces/Perl
	make DESTDIR="$pkgdir" install
}
