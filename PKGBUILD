# Maintainer: Robert Greener <me@r0bert.dev>
_cranname=nloptr
_cranver=2.0.3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="R Interface to NLopt"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(LGPL3)
depends=(
	r
	r-testthat
	nlopt
)
checkdepends=(
	r-knitr
	r-rmarkdown
	r-xml2
	"r-testthat>=3.0.0"
	r-covr
)
optdepends=(
	r-knitr
	r-rmarkdown
	r-xml2
	"r-testthat>=3.0.0"
	r-covr
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")

build() {
	mkdir -p build
	R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

check() {
	if [ -d "${_cranname}/tests" ]
	then
  		cd "${_cranname}/tests"
		for i in *.R; do
			R_LIBS="${srcdir}/build" Rscript --vanilla $i
		done
	fi
}

package() {
	install -dm0755 "${pkgdir}/usr/lib/R/library"

	cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"
}

sha256sums=('7b26ac1246fd1bd890817b0c3a145456c11aec98458b8518de863650b99616d7')
