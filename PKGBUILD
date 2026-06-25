# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Alex Branham <branham@utexas.edu>

_pkgname=zip
_pkgver=3.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Cross-Platform 'zip' Compression"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
makedepends=(
  r-cli
)
checkdepends=(
  7zip
  r-curl
  r-testthat
  r-webfakes
)
optdepends=(
  r-callr
  r-cli
  r-curl
  r-pillar
  r-processx
  r-r6
  r-testthat
  r-webfakes
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8a975bcb98d7efc62f6d5b5510873d18')
b2sums=('094b746dcba04d73493888d3771ed5f30a2aeedd63dd7b35e9f0a7fc146d4218d687d18a25ecd0e9963bce1e9305850aeed37fb921dd88a1260ed3980e478657')

build() {
  mkdir -p build
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
