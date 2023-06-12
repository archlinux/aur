# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=adabag
_pkgver=5.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc="Applies Multiclass AdaBoost.M1, SAMME and Bagging"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-caret
  r-consrank
  r-doparallel
  r-dplyr
  r-foreach
  r-tidyr
)
optdepends=(
  r-mlbench
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('675cf557792d970a2115e0f7a44f4954')
sha256sums=('ec58756fda2e64753d21e28d9e27ed34f28020045b199a58dcea06a3e2c3d60e')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
