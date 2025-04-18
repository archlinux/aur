# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=regionalpcs
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('f3bba8b76b5cdbcce8882b0452c1d294')
b2sums=('4586290f6356b1d3212d1bfac06f9eb09bbf2517022c3831421e6a62885abfd6e4f8325f0447e635c464ffd22b23b1a35dffdb12658ff7bd07a9efbbbd291e3e')

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
