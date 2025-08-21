# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=protr
_pkgver=1.7-5
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
md5sums=('9a473639df11abd1847b09dc113b93dc')
b2sums=('148663e60c840ceb6a41bf1aa0ad8231e432cd254b7fd61b15e2124e150848a195622f20e61bd2e4002638ad3c63be927f80f4d8d133d32fd5e5dd2361baea58')

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
