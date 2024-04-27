# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDR
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Umbrella package for R packages in the gDR suite"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-gdrcore
  r-gdrimport
  r-gdrutils
)
checkdepends=(
  r-gdrtestdata
  r-testthat
)
optdepends=(
  r-biocstyle
  r-bumpymatrix
  r-futile.logger
  r-gdrstyle
  r-gdrtestdata
  r-kableextra
  r-knitr
  r-markdown
  r-purrr
  r-rmarkdown
  r-summarizedexperiment
  r-testthat
  r-yaml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('abefb906e5c9ec014a443b0367844ac9')
b2sums=('8935d38e130675b1193a22b4630614640749e1b188209b96070c000e124b5da15b2eb94d0f113573d39046d266cf28443d08d1996939da3007cf6676db5da45a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
