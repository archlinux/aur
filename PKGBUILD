# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CTSV
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identification of cell-type-specific spatially variable genes accounting for excess zeros"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocparallel
  r-knitr
  r-pscl
  r-qvalue
  r-spatialexperiment
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6e93a12d20ccf03fd34988d45edfae1b')
b2sums=('b91d05f0d1d2c58555ce62cc35f8b7b7e8f9eac29ae18ce8dad1e8a91d3fe50a64075c1e1c0431acf1e08bb6b31b64889bdd2cd2dbae70e0000a7f0bed9ac43e')

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
