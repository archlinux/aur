# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qpdf
_pkgver=1.4.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Split, Combine and Compress PDF Files"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
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
md5sums=('01b3f14785ba200c66bf719d2f857cf0')
b2sums=('fbb3cae3d322b7f823a43c9828ccf89b9884e0c054ba1415712f85fc33a38bc8f7d1c20e8291e43b2f0caf4c4bac86bea7e8a3e3ca99f71830cf79108d5c8e9e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname" \
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
