# Maintainer: Hal Gentz <zegentzy@protonmail.com>

pkgname=blaze-git
pkgver=3.1.r679.e48767c20
pkgrel=1
pkgdesc="An open-source, high-performance C++ math library for dense and sparse arithmetic."
arch=('i686' 'x86_64')
url="https://bitbucket.org/blaze-lib/blaze"
license=('New BSD')
optdepends=('blas: for maximum performance.'
			'lapack: for computing the determinant of a dense matrix and for the dense matrix inversion.'
			'boost: to use Boost threads to run numeric operations in parallel.')
makedepends=('git')
provides=('blaze')
conflicts=('blaze')
source=("$pkgname::git+https://bitbucket.org/blaze-lib/blaze.git")
md5sums=('SKIP')

pkgver() 
{
	cd "$srcdir/${pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

package()
{
	cd "$srcdir/$pkgname"

	# New BSD license
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# include files
	install -d -m644 "${pkgdir}/usr/include"

	cp -r ./blaze "${pkgdir}/usr/include"
	
	find "${pkgdir}/usr/include" -type d -exec chmod 755 {} \;
	find "${pkgdir}/usr/include" -type f -exec chmod 644 {} \;
}
