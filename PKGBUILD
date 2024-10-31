# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HilbertVis
_pkgver=1.64.0
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
md5sums=('627ad4e5725a9044727aa1ef90e3da09'
         '0aaecc29f52ba18887ffd658a3dacd35')
b2sums=('1372ca7caaa39c44321997fc23848d389868b272696ebebe9e6b51056320dab7570110d8a926b1913df28a8eaa8be53c3a063a7e830ad89de2cf758f58c7c20f'
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
