# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=affxparser
_pkgver=1.82.0
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
md5sums=('9f748ecae1c1ed5c10113e2dbced634d'
         '3003f5b61fc426c2f977e4cd277e9f44')
b2sums=('a30145868ef29aa1fdbb668ea93f16d6bfa0c6105d5d6b2df16e493c96c655c68c45db9a3d28433a74632dd78062f3cf27381d2596761407d38b2ac75b189ad7'
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
