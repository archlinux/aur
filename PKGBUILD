# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Pranav K Anupam <pranavanupam@yahoo.com>

_pkgname=googlesheets4
_pkgver=1.1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('8b017d8e142ceb41bd0baaee823a6508')
b2sums=('04bb2cf042e8dfa20bb78e3ca6ec99db861ecd1ecacfe68f78153688cd67bcd35f651cd5bcbe1ddd2b7115c6ab0cc348b3e22d992361978955840f35eed6a660')

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
