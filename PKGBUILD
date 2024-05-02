# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggmanh
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Visualization Tool for GWAS Result"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-gdsfmt
  r-ggplot2
  r-ggrepel
  r-rcolorbrewer
  r-rlang
  r-scales
  r-seqarray
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-genomicranges
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dac12850e0b997a1412f64cbcc38b04e')
b2sums=('8da79bfae9cbb7c4f8eff8b842398b77b97394428daf425e4556c8b6a5718066c529c6dea655b6a225edb91dd7f9f125f40ba172909117e788a6085db3976738')

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
