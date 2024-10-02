# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqminer
_pkgver=9.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Efficiently Read Sequence Data (VCF Format, BCF Format, METAL Format and BGEN Format) into R"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later AND MIT')
depends=(
  bzip2
  r
  sqlite
  zlib
  zstd
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-skat
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('084c1f805f31e9672fcc393362577e5c')
b2sums=('1ca25cd84448a0e70fbd48504f7d31a52774b2c10a5943d79353105228a9cbaa57e8b29bacdc6882683d1c6ba9742040d37bbbf1aa246044bc7501b8382164ef')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
