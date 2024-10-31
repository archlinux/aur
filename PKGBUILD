# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=crisprBase
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Base functions and classes for CRISPR gRNA design"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocgenerics
  r-biostrings
  r-genomicranges
  r-iranges
  r-s4vectors
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
md5sums=('0e88d059c03ecf11df89c18bc3811bba')
b2sums=('02ba1e3eb92dfc8e45ec070f66539bd64fc60bba1853f70c6e43d10b90d98a44cbeea57cc3d02898a33ca6a492688844c601a2a480176d20f3fe2f9cdaee4a31')

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
