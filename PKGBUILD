# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Pranav K Anupam <pranavanupam@yahoo.com>

_pkgname=googlesheets4
_pkgver=1.1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Access Google Sheets using the Sheets API V4"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
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
sha256sums=('c5cc63348c54b9de8492e7b12b249245746ea1ff33e306f12431f4fc9386fccf')

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
