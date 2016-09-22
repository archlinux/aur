# Maintainer: Stephen Martin <stephenSRMMartin at gmail dot com>
pkgname=jasp-rbundle
pkgver=2016.09.22
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
provides=('r-cran-rinside')
conflicts=('r-cran-rinside')


prepare(){
	mkdir -p $srcdir/usr/share/jasp-desktop/R/library
}

build(){
	cd $srcdir
	_libraryPath=$srcdir/usr/share/jasp-desktop/R/library
	Rscript rbundle.R $_libraryPath
}

package(){
	cp -r $srcdir/usr $pkgdir/
	mkdir -p $pkgdir/usr/lib/R/library
	mv $pkgdir/usr/share/jasp-desktop/R/library/RInside $pkgdir/usr/lib/R/library/
}	
md5sums=('3e460035be3f27cd4a059166b1db2785')
