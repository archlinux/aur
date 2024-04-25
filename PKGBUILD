# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DCATS
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Differential Composition Analysis Transformed by a Similarity matrix"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-aod
  r-e1071
  r-matrixstats
  r-mcmcpack
  r-robustbase
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-seurat
  r-seuratobject
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8a6002426027bd88d05a2b8759d5a12e')
b2sums=('3a1cea1c042368da4a1c4309cf4f87e77a98abad96bffe57daa4dc8f6082ac281dfd600867b6a2f5f8657d351ea89f396ce390a145b3053dafa57d259557bba8')

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
