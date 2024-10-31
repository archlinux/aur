# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mslp
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Predict synthetic lethal partners of tumour mutations"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-data.table
  r-dorng
  r-fmsb
  r-foreach
  r-magrittr
  r-org.hs.eg.db
  r-proc
  r-randomforest
  r-rankprod
)
checkdepends=(
  r-tinytest
)
optdepends=(
  r-biocstyle
  r-dofuture
  r-future
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d1daaf0f5a6170eed32cc5462d94ee47')
b2sums=('c0d0bd0dac33da70ec91c571e8394d1b9c8de73ee73cf44c297fde51dc47a833a5bf5c638befbbe794365e731b00f9552352a278abbbe180ca5fa21c115593e9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla tinytest.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
