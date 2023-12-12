# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tidyseurat
_pkgver=0.7.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Brings Seurat to the Tidyverse"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
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
md5sums=('e112239c72797c4e3a81852c6f3bb555')
sha256sums=('ba3600f067cd5c57ec95ac6ee43912230cc5558097196073f035765ad288df7b')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
