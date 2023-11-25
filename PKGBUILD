# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=IsoBayes
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="IsoBayes: Single Isoform protein inference Method via Bayesian Analyses"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-data.table
  r-doparallel
  r-dorng
  r-foreach
  r-ggplot2
  r-glue
  r-hdinterval
  r-iterators
  r-rcpp
  r-s4vectors
  r-summarizedexperiment
)
makedepends=(
  r-rcpparmadillo
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d9e1de9f5a1f8279117fde4cc997725d')
sha256sums=('8b33a8b610bbb746e01055d5358e8cf780ccc2bf058af4309aa6b41f9065968c')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
