# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=regionalpcs
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Summarizing Regional Methylation with Regional Principal Components Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-dplyr
  r-genomicranges
  r-pcatools
  r-tibble
)
checkdepends=(
  r-rmtstat
  r-testthat
)
optdepends=(
  r-biocstyle
  r-iranges
  r-knitr
  r-minfidata
  r-rmarkdown
  r-rmtstat
  r-testthat
  r-tidyr
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('37f0fc1370efacc719f72b419455096a')
b2sums=('79f12abf5c18e86528288c9a57acc0c8baf23543344b9dff8f96ddab271a416a01b9b830369e8ec1cedbdf53c2910c952c45daf632b3572bd3ad8ecdb3681f3a')

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
