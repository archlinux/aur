# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=PSMatch
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Handling and Managing Peptide Spectrum Matches"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
depends=(
  r-biocgenerics
  r-biocparallel
  r-igraph
  r-mscoreutils
  r-protgenerics
  r-qfeatures
  r-s4vectors
)
checkdepends=(
  r-msdata
  r-mzid
  r-mzr
  r-spectra
  r-testthat
)
optdepends=(
  r-biocstyle
  r-factoextra
  r-knitr
  r-msdata
  r-mzid
  r-mzr
  r-rmarkdown
  r-rpx
  r-spectra
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4c63ca3d541af4e5925bcc2bde7d67ea')
sha256sums=('d2776c4c3fa21073b8f444d8f581fcfadc1ef3832ea74bf948478500e2fa2350')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
