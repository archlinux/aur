# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=PSMatch
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Handling and Managing Peptide Spectrum Matches"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
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
b2sums=('aa12dc6a82a75ed6a6b701ea87d56f9cc78da8caa496c0f01038ee2a4e91c630fd3bc54d300ca6650c9a931dc3285ddca5074fa39f96607eb807e3f949bfece2')

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
