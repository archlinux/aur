# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=nnSVG
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Scalable identification of spatially variable genes in spatially-resolved transcriptomics data"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
depends=(
  r-biocparallel
  r-brisc
  r-matrixstats
  r-singlecellexperiment
  r-spatialexperiment
  r-summarizedexperiment
)
checkdepends=(
  r-scran
  r-stexampledata
  r-testthat
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-scran
  r-stexampledata
  r-testthat
  r-weberdivechalcdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4af169b12d944eff8ee9d9e3063ff5ea')
sha256sums=('6b758eb69964a2a061f2e5bf9746a364e994902540dab9eb4f80e9b1c0348d04')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
