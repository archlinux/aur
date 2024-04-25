# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=affxparser
_pkgver=1.74.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
        "fix-build.patch"
        "fix-makevars.patch")
md5sums=('2b6b9373d749a0ccbf930f834df90b92'
         '6c83c3b0540e4355227d8048f86489c8'
         '3003f5b61fc426c2f977e4cd277e9f44')
b2sums=('5ac91a8b6df17fd403722d8f798c17f88107335c0ea23dbea14e316e823dd0897e5c5aa5c0739f8cbb028f0b65eb12905d0696b2f2c9a42555cd277d1494ebc2'
        '08e825439a575284b50e7ef7ca878a6eca35498037f9f44b3a23126c0772409eb2fad274019ef0dde87eb3e3d9059db0c052690848a9f175a744c1479da19c5f'
        '263668f9ca395d380a7a2a2ed048cc33fd63418546fde998271504ab04fa2a8589d31a07de3f9470919455631fa77cb68bfdfa553164508bcf9c293a87d233e2')

prepare() {
  # fix format string errors
  patch -Np1 -i fix-build.patch
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
