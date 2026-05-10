# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=multiMiR
_pkgver=1.34.0
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
md5sums=('d005ef6d82b7adc890760c02eb7f2969')
b2sums=('410aace2953ec43b3f19fa5cae9ce025845f3965e0c9a8e1bfc67ebe1c6287c3dab72b0cfa912845ae426518ef979822c9fda337db374c12694fe36e7d725199')

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
