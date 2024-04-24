# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=Rttf2pt1
_pkgver=1.3.12
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="'ttf2pt1' Program"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('LicenseRef-Rttf2pt1')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "$_pkgname-use-ldflags.patch::https://github.com/wch/Rttf2pt1/pull/23.patch")
md5sums=('993029fbdbaeb22d5b20368d071a1dcd'
         '5b143bc1fa8b037ad0a72da32165e7bf')
b2sums=('6c264e8e6f066efefd3acf68d60089da7b879ae0a9971aea1640e519d534142976ea1d0824e6d2c26ba9098f8b0db149d4c38c0be016f5c663afceb7102f2bec'
        'febed18b56f75bba58a2505f413bb5934fd3a8b06d7e78b0e1574caacc236ba9180c31349bb6eacd91726e671a5981a272da2a123f48d2f574ad6d6c3ca677a5')

prepare() {
  cd "$_pkgname"
  # use LDFLAGS
  patch -Np1 -i "../$_pkgname-use-ldflags.patch"
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
