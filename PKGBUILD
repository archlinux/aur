# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=nnSVG
_pkgver=1.6.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Scalable identification of spatially variable genes in spatially-resolved transcriptomics data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
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
md5sums=('7e39d32cf6dd4a19a46f0fa94980444d')
b2sums=('f9591212e953df191e0be6dc3eebda1898de3fe27b7db137b6edbfdebf2843b5a3160a79950a9762f38318d554e9811b7b6c4ef5e13ae21dce4e167714224a59')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
