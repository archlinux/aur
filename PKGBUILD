# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DGEobj
_pkgver=1.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Differential Gene Expression (DGE) Analysis Results Data Object"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-assertthat
  r-magrittr
  r-stringr
)
checkdepends=(
  r-biomart
  r-edger
  r-genomicranges
  r-testthat
)
optdepends=(
  r-biomart
  r-conflicted
  r-dplyr
  r-edger
  r-genomicranges
  r-glue
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8d84369964ade6ee4707681568feb390')
b2sums=('5cc386608324e5e0f702a45f57f69ad422ec5d4fd592a51245cb390e7c35d425f4157092645ee01f1686e67c0d92f131ac9da4b1de4db8ba1e49092fdc14f8c4')

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
