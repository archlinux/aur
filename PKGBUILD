# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MNP
_pkgver=3.1-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fitting the Multinomial Probit Model"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  lapack
  r
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b6576adc05175eaef71d9766d23f1eac')
b2sums=('47dcfe87614c2f4c0d14ce3716177223ddd1461c5044c9254ef7d24eff9c1015f0edfd1626568e62c07db186799d870b8a5e97c85e2b4494c81206cd41424280')

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
