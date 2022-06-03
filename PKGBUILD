# Maintainer: Robert Greener <me@r0bert.dev>
_cranname=Ckmeans.1d.dp
_cranver=4.3.4
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Optimal, Fast, and Reproducible Univariate Clustering"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(LGPL3)
depends=(
	r
	r-rcpp
	"r-rdpack>=0.6.1"
)
checkdepends=(
	r-testthat
	r-knitr
	r-rmarkdown
	r-rcolorbrewer
)
optdepends=(
	r-testthat
	r-knitr
	r-rmarkdown
	r-rcolorbrewer
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

sha256sums=('4691b5b55a91f9f2fb6a2e2b77a3017c62ab9f4e0ca6a928af1f8ef3acba29d3')
