# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=crisprScore
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="On-Target and Off-Target Scoring Algorithms for CRISPR gRNAs"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocgenerics
  r-biostrings
  r-crisprscoredata
  r-iranges
  r-randomforest
  r-reticulate
  r-stringr
  r-xvector
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('73d4799226f7ba3505f2372b6f648942')
b2sums=('8c745e12ecd3a6f54b8131f189d55b506b0b8c635ae489f0a55881127b699c4a5dba2d685f1aec12652672b870afc0288157a0b44f11c9f3bceb5f9b8bf02433')

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
