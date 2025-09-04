# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Pranav K Anupam <pranavanupam@yahoo.com>

_pkgname=googlesheets4
_pkgver=1.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Access Google Sheets using the Sheets API V4"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-cellranger
  r-cli
  r-curl
  r-gargle
  r-glue
  r-googledrive
  r-httr
  r-ids
  r-lifecycle
  r-magrittr
  r-purrr
  r-rematch2
  r-rlang
  r-tibble
  r-vctrs
  r-withr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-readr
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('21094083f375d8f9d1499263de1d9ecc')
b2sums=('9c90ca8625c34306ad7bd7355818d54aaa179d5dc5b7ade5137b3910f2ace864493d984ae4a5483a7c5d6e7bfdeb3b74e168030b010a4b1e9b77f477717c8fe6')

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
