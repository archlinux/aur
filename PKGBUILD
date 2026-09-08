# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=readODS
_pkgver=2.3.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Read and Write ODS Files"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-cellranger
  r-minty
  r-stringi
  r-tibble
  r-vctrs
  r-withr
  r-zip
)
makedepends=(
  r-cpp11
)
checkdepends=(
  r-knitr
  r-readr
  r-testthat
)
optdepends=(
  r-covr
  r-desc
  r-knitr
  r-readr
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a27f7cf07779c0f0861889519c0acbcb')
b2sums=('f8bd46319f0daae10b358ed38986a847756383bee70e69795b0feb5fb8c5f68f09803b63adc7b5bb1f0b5badf0be00123c8aa8fb5eb10f5663e2e54b87593a28')

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
