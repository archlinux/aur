# Maintainer: fncnt <aur at vncnt dot eu>

pkgbase=rnablueprint
pkgname=('rnablueprint' 'python-rnablueprint' 'perl-rnablueprint') #'python2-rnablueprint')
pkgName=('RNAblueprint')
pkgver=1.3.3
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
             #'python2')
source=("$pkgname-${pkgver}.tar.gz::https://github.com/ViennaRNA/RNAblueprint/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('a469e99274266e1321694319133b52d6')
sha1sums=('c26534952f1a269d648f4b43b5f1a8a3d954f62c')
sha256sums=('92891e6da5b03fb4b200d219a3d49532cecc70cddb641e7280275fc3e9c0253b')

prepare() {
	cd "$srcdir/$pkgName-$pkgver"
	./autogen.sh
}

build() {
	cd "$srcdir/$pkgName-$pkgver"
	./configure --prefix=/usr --disable-python2
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
