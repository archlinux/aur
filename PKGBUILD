# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=Rttf2pt1
_pkgver=1.3.12
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="'ttf2pt1' Program"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(custom)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "$_pkgname-use-ldflags.patch::https://github.com/wch/Rttf2pt1/pull/23.patch")
md5sums=('993029fbdbaeb22d5b20368d071a1dcd'
         '5b143bc1fa8b037ad0a72da32165e7bf')
sha256sums=('0b4b7a303990369a6944de817b6bd220b400942fcabf42c04fb5b56f1b40a583'
            '27bacf2cae051bca1598f5c062f2cf1fbd4101e5bb8034c0585e2840d80d8cb6')

prepare() {
  cd "$_pkgname"
  # use LDFLAGS
  patch -Np1 -i "../$_pkgname-use-ldflags.patch"
}

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
