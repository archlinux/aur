# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=regionalpcs
_pkgver=1.10.0
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
md5sums=('e1daed1ec430f094541ed14959327fd9')
b2sums=('8356412de6bc9a45888a086469118f39cde2149958d421a477c8eeec219d33904d78d6b26ff6bbf9f72f291a29067665405841a74595b964427f6b2e254a27fa')

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
