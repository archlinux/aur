# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=affxparser
_pkgver=1.84.0
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
md5sums=('e68c06b41f7d76b56eb95eedb4b5a272'
         '3003f5b61fc426c2f977e4cd277e9f44')
b2sums=('66abf07623c9610d559a270a8c56020c3a8a13ad37179b3629bda11d8c77d60f5364c5982164ae29fef2ef368cedda99bf69b2b60476efa78c00a287c75b2320'
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
