# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pRolocdata
_pkgver=1.44.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data accompanying the pRoloc package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
  r-msnbase
)
checkdepends=(
  r-summarizedexperiment
  r-testthat
)
optdepends=(
  r-proloc
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('73a265225b9e3439658becbbfba73dfe')
b2sums=('46a2c27797429788305aadc7a643b46571f7e086e423cef1056f35c21ca7e77248f55ccd146d69a4790f834e97433d2ba7b9419ad8c266535c3dae86d64a0fdd')

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
