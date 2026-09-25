# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tidyseurat
_pkgver=0.8.10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Brings Seurat to the Tidyverse"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-cli
  r-dplyr
  r-fansi
  r-generics
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
  r-rbibutils
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ded8af83e9d864050a57418bd3b63158')
b2sums=('fc68947373fa523ed7e1d7678e5ea38d61bd3b819ce6bf5d3aed73a5d67edfa4a532873c77d268d4b50f5a3045fd2ce8680948e8188094ede8e5a7d6118f88c1')

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
