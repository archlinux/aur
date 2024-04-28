# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HarmonizR
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('6e81c009fe8678273d8091378ae2f8e3')
b2sums=('98165c2c75933c150ae2554a3d401f2a1da7ff56340b180cfdce4dd9d62f0d2109cdfa31c034970e7d6f21478a0a7557a4b4e4af16781d60802b25ca33ee8c20')

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
