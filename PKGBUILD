# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HilbertVis
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Hilbert curve visualization"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-ebimage
  r-iranges
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-build.patch")
md5sums=('b30abc9c50034b41daf1399031d657e3'
         '0aaecc29f52ba18887ffd658a3dacd35')
b2sums=('01bf68e2e9abfb2288f0867103497b6d23631ba7499d3c74956e8fc376ec65b4df95131524cc45e127edbd62ef3662015218b3035f376f95a1bfc717c0d6986b'
        '69e912f57f4319974fd5d5161bff4d66930da2ecada4aaaab78dabfc70feb9bdf2aa56b1936e9533b728e37e09eae6cc9e4ef0f061a45688d988833a76c5c066')

prepare() {
  # fix format string errors
  patch -Np1 -i fix-build.patch
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
