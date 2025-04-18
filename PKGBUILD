# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HarmonizR
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Handles missing values and makes more data available"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-doparallel
  r-foreach
  r-janitor
  r-limma
  r-plyr
  r-seriation
  r-summarizedexperiment
  r-sva
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('34b5ce1ee0781ace9de55a2a0aeb02a8')
b2sums=('69ff43f754bc24c85ceb8688e762c9a55a12176d7d2832e7e716407c68931b2a11ec85a917375f9554a9558e3cedcaaf2049b2da5a75904779877a2c312ba57b')

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
