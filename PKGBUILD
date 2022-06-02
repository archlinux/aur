# Maintainer: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <alex.branham@gmail.com>

_cranname=rstan
_cranver=2.21.5
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="R Interface to Stan"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=(
	"r>=3.4.0"
	"r-stanheaders>=2.21.0"
	"r-ggplot2>=3.0.0"
	r-inline
	"r-gridextra>=2.0.0"
	"r-rcpp>=0.12.0"
	"r-rcppparallel>=5.0.1"
	"r-loo>=2.3.0"
	r-pkgbuild
	"r-rcppeigen>=0.3.3.3.0"
	"r-bh>=1.72.0.2"
	pandoc
)
checkdepends=(
	r-runit
	r-matrix
)
optdepends=(
	r-runit
	r-kernsmooth
	r-shinystan
	r-bayesplot
	r-rmarkdown
	r-rstantools
	r-rstudioapi
	r-matrix
	r-knitr
	r-v8)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("aaf0ff5739179675d98238a95f2f423c2a55eb9b38bf2a3e43c9d0433489707c5b66b25919d895a31c6d281bd3ac92783c80d78ac44b79f808a369d2c3a5c9f1")

build() {
	mkdir -p build
	R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build"
}

check() {
	cd "${_cranname}/tests"
	R_LIBS="${srcdir}/build" Rscript --vanilla doRUnit.R
}

package() {
	install -dm0755 "${pkgdir}/usr/lib/R/library"

	cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"
}
