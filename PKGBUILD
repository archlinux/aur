# Maintainer: Martin Siebenborn <m siebenborn at gmx dot de>
# Contributor: Ankit Tyagi <civil tyagi At GoogleMail Dot Com>
pkgname=getfem
pkgver=v5.4.4
pkgrel=1
pkgdesc="A finite element framework for partial differential equations"
arch=('x86_64')
url="http://getfem.org"
license=('LGPL3')
depends=('python-numpy'
         'python-scipy'
         'qhull'
         'superlu'
         'blas'
         'lapack')
makedepends=('git'
             'base-devel'
             'python-setuptools')
provides=('gmm')
conflicts=('gmm')
source=("$pkgname::git+https://github.com/getfem/getfem.git")
sha512sums=('SKIP')
build() {
    cd "$srcdir/$pkgname"
	git checkout "$pkgver"
	./autogen.sh
	./configure --prefix=/usr \
		        --with-pic \
				--enable-shared \
				--enable-python \
				--enable-superlu \
				--disable-matlab \
				--disable-scilab
	make
}
package() {
    cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
  	rm -r "$pkgdir/usr/getfem_toolbox"
}
