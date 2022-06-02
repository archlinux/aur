# Maintainer: Robert Greener <me@r0bert.dev>

_cranname=reticulate
_cranver=1.25
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Interface to 'Python' modules, classes, and functions"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(Apache)
depends=(
	"python>=2.7.0"
	"r>=3.0"
	"r-matrix"
	"r-rcpp>=0.12.7"
	"r-rcpptoml"
	"r-here"
	"r-jsonlite"
	"r-png"
	"r-rappdirs"
	"r-withr"
)
checkdepends=(
	r-testthat
	python-numpy
	python-pandas
	python-pipenv
	python-poetry
	python-scipy
	python-matplotlib
	python-virtualenv
	python-plotly
)
optdepends=(
	"r-callr"
	"r-knitr"
	"r-rlang"
	"r-rmarkdown"
	"r-testthat"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha512sums=("0bed6f67b67dc796a89cf82215fd4b37c6d5dc4999c5c61c34b66657a7c3afb70c880f1d27c8f458102410f797a278c777440e8a134fb073e0d70bb01c7e5478")

build() {
	mkdir -p build
	R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build"
}

check() {
	cd "${_cranname}/tests"
	R_LIBS="${srcdir}/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"
}
