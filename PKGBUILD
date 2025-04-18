# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Macarron
_pkgver=1.12.0
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
md5sums=('548600285b724e2743c2c82c268ae946')
b2sums=('44496172fa2bc0a4712a6552c0085f3340bd24404215d556842dff858f8d88271cb9c18fa2f9900517069140667301a4fa37296db3f94078e70ac89c04e9f0b6')

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
