# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tidyseurat
_pkgver=0.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Brings Seurat to the Tidyverse"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-cli
  r-dplyr
  r-ellipsis
  r-fansi
  r-ggplot2
  r-lifecycle
  r-magrittr
  r-pillar
  r-plotly
  r-purrr
  r-rlang
  r-seurat
  r-seuratobject
  r-stringr
  r-tibble
  r-tidyr
  r-tidyselect
  r-ttservice
  r-vctrs
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-ggally
  r-knitr
  r-markdown
  r-singler
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('844d068094e1d6b8e025cddc65eb336b')
b2sums=('d53d63e8c75f2ca1e68a9cc9ed8a6dbf20714089cb67bd2c287f07115fa2890555bb4ca50edd58cd6b1f709de5950fb9b60b7bcb5ebd6aca1ac23248e23dff25')

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
