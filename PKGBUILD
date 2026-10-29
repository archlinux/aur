# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Pranav K Anupam <pranavanupam@yahoo.com>

_pkgname=googlesheets4
_pkgver=1.1.3
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
md5sums=('bf92d615c0f33c62c3f7e916d43195c7')
b2sums=('aed2b3da939b196f0b590801ccde46093287ca6a2521222134bcf68889e3281fd0d0e30b8093b5e350b766128fee690e9588ef577d44530e96974bee4fb8140d')

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
