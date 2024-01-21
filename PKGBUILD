# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dqrng
_pkgver=0.3.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Fast Pseudo Random Number Generators"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('AGPL-3.0-only AND CC0-1.0 AND (Apache-2.0 OR MIT)')
depends=(
  r-rcpp
)
makedepends=(
  r-bh
  r-sitmo
)
checkdepends=(
  r-mvtnorm
  r-testthat
)
optdepends=(
  r-bench
  r-knitr
  r-mvtnorm
  r-rmarkdown
  r-sitmo
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "$_pkgname-MIT.txt::https://github.com/imneme/pcg-cpp/raw/428802d1a5634f96bcd0705fab379ff0113bcf13/LICENSE-MIT.txt")
md5sums=('6f3ee0d3b89f90deb993032e8185e487'
         'd1856a8ee85a056b55fe534e034bcd21')
b2sums=('4c494bd41efefdf6ce3e23d6fb3bec2194f40e2e87f5fad7ee90497081e088b1cceb1078c44f3adb1125bba6365fa648f7d2afa65988f0d563b72223a20602a4'
        'e8d10a047b62ed8443f72262e0d5084c9ba83e745adf4ff8eb71ecddf5d08815fe7bf05466d3c135e7f831dfc38d3c7c68986a25f2cfe60ab6a08ad1a4c61fd6')

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

  install -Dm644 "$_pkgname-MIT.txt" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
