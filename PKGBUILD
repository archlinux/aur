# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=enrichViewNet
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="From functional enrichment results to biological networks"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-enrichplot
  r-gprofiler2
  r-jsonlite
  r-rcy3
  r-strex
  r-stringr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5b2eb51ee4f57abd3b77da182e7e5d1a')
b2sums=('a6412415bfbc3790ef5626e55f594b23a26da23cad38d889df068e0e5f8aeca9ae1b00f7b980b97afd0c1e410621bedb675ccfc860d38838271e180fa628eec6')

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
