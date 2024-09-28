# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BEDMatrix
_pkgver=2.0.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Extract Genotypes from a PLINK .bed File"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-crochet
)
optdepends=(
  r-data.table
  r-linkedmatrix
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('750a22f4e967696a39624442126e0470')
b2sums=('f3527a7b2c85e52ffcf50994021068ff1ee39be2ce03d8306f8e4e2e233cfe4945e3ca962b43e1d81ecbb0f841048bbd8e90c2630b861a410a0561817cf5e51d')

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
