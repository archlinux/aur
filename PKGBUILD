# Maintainer: Robert Greener <me@r0bert.dev>

_cranname=mockr
_cranver=0.2.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Provides a means to mock a package function, i.e., temporarily substitute it for testing"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=(
	r
	r-rlang
	r-withr
)
checkdepends=(
	r-testthat
)
optdepends=(
	r-covr
	r-fs
	r-knitr
	r-pkgload
	r-rmarkdown
	r-testthat
	r-usethis
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("aaa04da0af31028290f6dd72cc089d5a0f725bcc63648964a78325d76edad54ada33ba3530f6af3bbd9f164fee485cbcac548a55674675cb53929ee7b2b7870d")

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
