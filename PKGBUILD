# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=multiMiR
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Integration of multiple microRNA-target databases with their disease and drug associations"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-annotationdbi
  r-biocgenerics
  r-dplyr
  r-purrr
  r-rcurl
  r-tibble
  r-xml
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-edger
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b6ae37ef2a74420c5ab7e7555cc0366d')
b2sums=('450566afed12ad59932710ceb11e4974799e6dffd80b704aab11331d7225867d94d9b2dd8b50eb5dd86314fbdc3abd099b099839344f482c23314feb6004fcca')

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
