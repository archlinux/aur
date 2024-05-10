# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Macarron
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Prioritization of potentially bioactive metabolic features from epidemiological and environmental metabolomics datasets"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocparallel
  r-data.table
  r-delayedarray
  r-dynamictreecut
  r-ff
  r-httr
  r-logging
  r-maaslin2
  r-plyr
  r-psych
  r-rjsonio
  r-summarizedexperiment
  r-wgcna
  r-xml2
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-markdown
  r-optparse
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f0ab96828900fe45d5eb914afa5baf89')
b2sums=('50a17512558616fdda67f672898a0d11cd2bf6ebcb8c57f41b77d22628abcefc5fc1b8752d4c1b8d37bcf9aaa785dbdc0e0e60a733b6260570a4d0ce494bef5d')

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
