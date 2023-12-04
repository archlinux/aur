# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=redux
_pkgver=1.1.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R Bindings to 'hiredis'"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL2)
depends=(
  hiredis
  r-r6
  r-storr
)
checkdepends=(
  r-sys
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-sys
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('13eb2a35ff97ad02e09b1e42ec8cff7c')
sha256sums=('201d7c89840f3d698fe94ec3fe4088a19c2a9dc19ee7ec300d5deeadd2606fb1')

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
