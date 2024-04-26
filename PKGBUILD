# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggmanh
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('dbbd8130e9ef70cb69c7e305af0c37d7')
b2sums=('d8df5796d54a089abf29d24a237d064abcdc37dd27e6ae4a13e796c83b3bb51ff9a799859dc1f9c1523e79838fed41b64ada339723b0a2637821016564a8bb4d')

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
