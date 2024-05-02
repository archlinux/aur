# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HilbertVis
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('b7e7d2620c1956bc7ab0e6634c513954'
         '0aaecc29f52ba18887ffd658a3dacd35')
b2sums=('428417dba3c98bad314312cab38b9e83cacf6310ce74c535285a4b921c171882ead49c8c605279b79019eb10f4ff2ffc48426a81f139d496bf196714d184a1f6'
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
