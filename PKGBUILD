# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qpdf
_pkgver=1.3.5
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
md5sums=('8aaffaa5217c796f7d69aa3f2095afd4')
b2sums=('641868f05af85a2ee25dedc0171e233a126bf35f8b3b60c9d398e366af365b82641e4f98480fb5018cbdc19922a59df0766893e3be198c6e9ecf19ef4c7b6b28')

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
