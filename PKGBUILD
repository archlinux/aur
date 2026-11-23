# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=qsvaR
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generate Quality Surrogate Variable Analysis for Degradation Correction"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-dplyr
  r-ggplot2
  r-rlang
  r-summarizedexperiment
  r-sva
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocfilecache
  r-biocstyle
  r-covr
  r-knitr
  r-limma
  r-refmanager
  r-rmarkdown
  r-sessioninfo
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7f647f9b7b94d4ec23fae53f75836a3e')
b2sums=('e9337820c927e43b5488d6d55d399cb5b3f36cbc4c219d21e5a8022e1343821fadc8a5392b5592daa0c2629ec8fc5151a47882594a55512f34130f4a8bdce382')

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
