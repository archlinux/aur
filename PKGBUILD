# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDR
_pkgver=1.4.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Umbrella package for R packages in the gDR suite"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-gdrcore
  r-gdrimport
  r-gdrutils
)
checkdepends=(
  r-gdrtestdata
  r-testthat
)
optdepends=(
  r-biocstyle
  r-bumpymatrix
  r-futile.logger
  r-gdrstyle
  r-gdrtestdata
  r-kableextra
  r-knitr
  r-markdown
  r-purrr
  r-rmarkdown
  r-summarizedexperiment
  r-testthat
  r-yaml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2bbad837a7c6bc1ea29caac84b1ca859')
b2sums=('1d97208e34b03a98fcf6cb5a920298fe1eb14698ef980c481819aec58cf50a082443084bac7a9ca0507d40f8396440587f48cd13aff0f483f9727c5249820609')

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
