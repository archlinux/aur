# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HiCExperiment
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bioconductor class for interacting with Hi-C files in R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocgenerics
  r-biocio
  r-biocparallel
  r-dplyr
  r-genomicranges
  r-interactionset
  r-iranges
  r-rhdf5
  r-s4vectors
  r-seqinfo
  r-strawr
  r-vroom
)
checkdepends=(
  r-hicontactsdata
  r-testthat
)
optdepends=(
  r-biocfilecache
  r-biocstyle
  r-hicontacts
  r-hicontactsdata
  r-knitr
  r-rmarkdown
  r-rtracklayer
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e00ad4bb0f7b67c3414426afb811731a')
b2sums=('da0ce91d4a9d2819efde02f2ab06f262b32be4430926054f44a668d24cbc10561cc7df61453c95cc70192aaddfdb553ddf69b32603887251d5788808583b5552')

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
