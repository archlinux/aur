# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=FeatSeekR
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="an R package for unsupervised feature selection"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-pheatmap
  r-pracma
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-dmelsgi
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9792a703c1ec0b4a58c759274c2cb571')
b2sums=('1883191f3db5e645966bfa1fda931076b8265d7f3609b2167b1f6c30e9e103f8153f54a6f7a9cca334cf49bb0c70e46a7e09ea87cd1402accd39224337863928')

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
