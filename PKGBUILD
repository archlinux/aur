# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=beer
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bayesian Enrichment Estimation in R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  jags
  r-biocparallel
  r-cli
  r-edger
  r-phipdata
  r-progressr
  r-rjags
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-covr
  r-dplyr
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c8e6192a3f9bd04b62ed564c8164ba00')
b2sums=('57b5c7fd6192486c06385e96dd1e54177c89f65a6db38ad4ffee9fa3dad435dbeca78061fcf9b5f3c766132158c41241ef30c3b632016199917f5904d368ca45')

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
