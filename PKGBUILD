# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=av
_pkgver=0.9.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Working with Audio and Video in R"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  ffmpeg
  r
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-gapminder
  r-ggplot2
  r-ps
  r-testthat
  r-curl
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b5746fdd93fdf24d862a408ac68ceebc')
b2sums=('a0aefe221bcd731feb855122c9e16ea29bffe8566b0f6c8bd3d5627ef93bc9bdfda35c7b8e229abcd5bbc851ec7f23770d7981c06c03e9a81ddbd3571f674c95')

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
