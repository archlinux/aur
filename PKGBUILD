# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDR
_pkgver=1.2.0
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
md5sums=('6de07f2da08fbd189411399e6109f0a0')
b2sums=('15fd985b1fa26ec84d59a6ef9349439aeddc1d4a0f47b3a17277fd775d91eedbfec5a3dc13f4c836a4c2ed28991c3061749378c5e2776cb4f288e1452d9e179c')

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
