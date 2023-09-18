# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=prediction
_pkgver=0.3.14
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tidy, Type-Safe 'prediction()' Methods"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
depends=(
  r-data.table
)
checkdepends=(
  r-aer
  r-aod
  r-betareg
  r-biglm
  r-brglm
  r-caret
  r-crch
  r-e1071
  r-earth
  r-gam
  r-gee
  r-glmnet
  r-glmx
  r-kernlab
  r-lme4
  r-mclogit
  r-mda
  r-mnp
  r-ordinal
  r-plm
  r-pscl
  r-quantreg
  r-sampleselection
  r-speedglm
  r-survey
  r-testthat
  r-truncreg
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f27a713e1265ac86ab47b06a32154e44')
sha256sums=('3daf9f03c12f932817376361fecae62b8f74f5cce3f09096a84645d769c1942b')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat-prediction.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
