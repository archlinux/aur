# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDR
_pkgver=1.6.0
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
md5sums=('1d0ea547b43e82313b92944e3cea56fb')
b2sums=('8a33c6c624ff501fd6d29cf82b4ed9be51fa6cad82632b5a629755399032376163aac233840992f24e58b57d755e264c190a785997ca31ec967273ee5fb0d7db')

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
