# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=VDJdive
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Analysis Tools for 10X V(D)J Data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-cowplot
  r-ggplot2
  r-gridextra
  r-iranges
  r-rcolorbrewer
  r-rcpp
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
)
checkdepends=(
  r-breakaway
  r-testthat
)
optdepends=(
  r-biocstyle
  r-breakaway
  r-covr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('938051376344953e02e510f65d156939')
b2sums=('6fe08829c262f98518ce09040df89100a3169293c4515ce4883b3360c4e9a46f2fc85db102b177008cf697bfdd8e1dcd5a1ba53d4105540d569c4340c83aa7e8')

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
