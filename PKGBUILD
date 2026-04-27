# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=circlize
_pkgver=0.4.18
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Circular Visualization"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-colorspace
  r-globaloptions
  r-shape
)
optdepends=(
  r-bezier
  r-complexheatmap
  r-covr
  r-dendextend
  r-gridbase
  r-knitr
  r-markdown
  r-png
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('14864d68a46b05150947469797f272ab')
b2sums=('df00490aca99345dced452b74723897b2943d79c28ca01c87084ac69f58013b74d9c14fd50854c38fc73b2f01b95facab4b3aeb011e0b6330f26b09ac497191f')

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
