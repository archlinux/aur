# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=IFAA
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Robust Inference for Absolute Abundance in Microbiome Analysis"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL2)
depends=(
  r-desctools
  r-doparallel
  r-dorng
  r-foreach
  r-glmnet
  r-hdci
  r-mathjaxr
  r-matrixextra
  r-parallelly
  r-s4vectors
  r-stringr
  r-summarizedexperiment
)
checkdepends=(
  r-biocgenerics
  r-runit
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('393ac86513ddc9adf474c654b5127394')
sha256sums=('5d387bb1af086bd724a6765140e618d70d1d9ed82ad73a1a4d93dd4f42430724')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
