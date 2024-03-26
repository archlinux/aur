# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qpdf
_pkgver=1.3.3
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
md5sums=('befda010dc47d87b6e988db7d6941768')
b2sums=('9ead90e9319b76f36815730c0d1cb3a80d0f8bab8541cb4be121b32fa730226cd94d10f45964654b11abbe8051fa1b3b0b0d4c2b75578eb7a89d73a3ccc8500f')

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
