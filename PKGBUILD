# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qpdf
_pkgver=1.3.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Split, Combine and Compress PDF Files"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(Apache)
depends=(
  qpdf
  r-askpass
  r-curl
  r-rcpp
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('683a7a73e5bd530b377987ea646f31db')
sha256sums=('d9c905a4879274d72de0c638f2e14737ec0a59895cbba9814e05c62b43e8e976')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build \
      --configure-vars=EXTERNAL_QPDF=yes
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
