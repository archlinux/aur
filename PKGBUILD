# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Macarron
_pkgver=1.16.0
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
  r-logging
  r-maaslin2
  r-plyr
  r-psych
  r-summarizedexperiment
  r-wgcna
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
md5sums=('8927a7449dd3e145cc8fd687af76b989')
b2sums=('8123c14718fc454ca69e7a418eb696a004bd2787b0b8ca98d9299edd59b471e2963631f8b955c3b4ff81684174093ce328f6c28220bbdac7f690437e75b9254b')

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
