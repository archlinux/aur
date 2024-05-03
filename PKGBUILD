# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HarmonizR
_pkgver=1.2.0
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
md5sums=('73fb93fd95452bca631f14d4e6744299')
b2sums=('130c69d9be775e48f4794dc8d043d5e863450c018ac754bbf5287697e534350ced5acf6cf56a563037087ead1eea4731b999fbeb28de7c31b3e93c45cf515155')

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
