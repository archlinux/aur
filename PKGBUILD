# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alabaster.spatial
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Save and Load Spatial 'Omics Data to/from File"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-alabaster.base
  r-alabaster.sce
  r-jsonlite
  r-s4vectors
  r-spatialexperiment
  r-summarizedexperiment
)
checkdepends=(
  r-dropletutils
  r-png
  r-testthat
)
optdepends=(
  r-biocstyle
  r-digest
  r-dropletutils
  r-knitr
  r-magick
  r-png
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('906d73c492ba97e8eda563055c51bbfc')
b2sums=('59430a8fd7bd435e3e6805181aa8afa812227316086ae3c51c6b8a288a2bc5088d14c5903632af1c003924f6b10b663beb93ede362654677aba4e5f583d4d7e1')

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
