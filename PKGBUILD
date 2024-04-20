# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=protr
_pkgver=1.7-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generating Various Numerical Representation Schemes for Protein Sequences"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-3-Clause')
depends=(
  r
)
optdepends=(
  r-biostrings
  r-doparallel
  r-foreach
  r-gosemsim
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cd8670e19c3830a3f73a63d353381448')
b2sums=('8646784caaa71c364755aae443f3b2b84a4c921b01dd137aac43a5cc7e8be59fbc6268969132601d1f1201971c17f98865f2003090f182c17dd7ac6f2410ea3d')

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
