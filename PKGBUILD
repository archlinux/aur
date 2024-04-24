# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OrgMassSpecR
_pkgver=0.5-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=8
pkgdesc="Organic Mass Spectrometry"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-2-Clause')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('37ae3ef0245548c68d6b3aef7832832f')
b2sums=('5463c4d986a84de11c218ebd853e8e45255d0184e880d42c98c0daa4becc1077dd4f9eba0f43803ae94820e397d9f11ede72a854761244707cca037e01a6d69f')

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
