# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=spaMM
_pkgver=4.4.16
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Mixed-Effect Models, with or without Spatial Random Effects"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('CECILL-2.0')
depends=(
  gsl
  r-backports
  r-crayon
  r-geometry
  r-gmp
  r-minqa
  r-nloptr
  r-numderiv
  r-pbapply
  r-proxy
  r-rcpp
  r-roi
)
makedepends=(
  r-rcppeigen
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-agridat
  r-blackbox
  r-foreach
  r-future
  r-future.apply
  r-infusion
  r-isorix
  r-lme4
  r-maps
  r-multilevel
  r-rcdd
  r-roi.plugin.glpk
  r-rsae
  r-rspectra
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "$_pkgname-LICENSE::http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt")
md5sums=('0e525101ec9034092e125b132e38ee5c'
         '599cf91b33571e942d3ba5f9623b8011')
b2sums=('b0a969682e9f004e2a879a4156fe8eede308f5e16c2a7a05fd0e9cd8b46469791df8f094125fe457c75264c6a4d2f50554bddf85c5c1d4679fc7135758cb4d64'
        'ff97dacc39b8597e670dbaf5bc0f0e4db73eada273708433fc227fa72c054a30a67dbc7b2416089d68f09ab65da721e5b30711022c41047d9cf706731d568038')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla test-all.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -Dm644 "$_pkgname-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
