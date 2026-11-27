# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggmanh
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Visualization Tool for GWAS Result"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-dplyr
  r-gdsfmt
  r-ggplot2
  r-ggrepel
  r-magrittr
  r-paletteer
  r-pals
  r-rcolorbrewer
  r-rlang
  r-scales
  r-seqarray
  r-tidyr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-genomicranges
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f3f5281a614bcfa1070a31c51fa24511')
b2sums=('16d0c88e3cf85bcbbdb1f92490a9b999e25f7fd1d090234d08ccef90f92634898bab3d4a932b8f3bd45e108849f57d3dd33cb6fefb6afacace02fc97775ac2f8')

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
