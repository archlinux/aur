# Maintainer: Stephen Martin <stephenSRMMartin at gmail dot com>
pkgname=jasp-rbundle
pkgver=2017.06.04
pkgrel=1
pkgdesc="A bundle of R packages needed by JASP desktop"
url="http://cran.r-project.org/"
arch=('any')
depends=('r')
makedepends=('r' 'gcc-fortran')
source=("rbundle.R")

pkgver() {
	echo $(date +%Y.%m.%d)
}
provides=('r-cran-rinside' 'r-cran-rcpp')
conflicts=('r-cran-rinside' 'r-cran-rcpp')


prepare(){
	mkdir -p $srcdir/usr/lib/JASP/R/library
}

build(){
	cd $srcdir
	_libraryPath=$srcdir/usr/lib/JASP/R/library
	Rscript rbundle.R $_libraryPath
}

package(){
	cp -r $srcdir/usr $pkgdir/
	mkdir -p $pkgdir/usr/lib/R/library
	mv $pkgdir/usr/lib/JASP/R/library/RInside $pkgdir/usr/lib/R/library/
	mv $pkgdir/usr/lib/JASP/R/library/Rcpp $pkgdir/usr/lib/R/library/
}	
md5sums=('65a18a87e12c25012d6291b1cea370c4')
