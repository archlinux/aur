# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=protr
_pkgver=1.7-3
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
md5sums=('319a8ff8699cc8b8b428a7ce569b9e8b')
b2sums=('e6d3722c2181b3f9905cc66f858d36a22165f0fa05047fe1ef6417562fc762eea2ef42626b9efd536bf05a9f9828d88f1743b0d138d0cf99adc3722d63e31fad')

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
