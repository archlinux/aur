# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=affxparser
_pkgver=1.76.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Affymetrix File Parsing SDK"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-affymetrixdatatestfiles
  r-r.oo
  r-r.utils
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-makevars.patch")
md5sums=('37156429dc8ffa3612fe74ac4f6a4a41'
         '3003f5b61fc426c2f977e4cd277e9f44')
b2sums=('5113ff5858ced83959a2563148d8da3758ef330ee70027db43ae6309cf5698047d82147cd83fd81f3039e8037d8860099f978a046560146c2429861cf2f74068'
        '263668f9ca395d380a7a2a2ed048cc33fd63418546fde998271504ab04fa2a8589d31a07de3f9470919455631fa77cb68bfdfa553164508bcf9c293a87d233e2')

prepare() {
  # fix optimization level and race condition
  patch -Np1 -i fix-makevars.patch
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
