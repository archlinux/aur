# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genArise
_pkgver=1.80.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Microarray Analysis tool"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LicenseRef-genArise')
depends=(
  r-locfit
  r-tkrplot
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('35a9a7930d54e4c4500fbf361b3abb6e')
b2sums=('40731475bcc64dc568471fc2c97ffc8be2adb4977fd39752ec578a715c87aff8a74bae5d1ad4ce3d4d106814b771f96410de6e7bf847876d187a833dcfffaf7e')

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
