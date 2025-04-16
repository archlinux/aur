# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rbowtie
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R bowtie wrapper"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0 OR LicenseRef-Rbowtie')
depends=(
  r
  zlib
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b17ba8e5d6dd7b319a0130466716d3bf')
b2sums=('05d1d6fa2a38d491a25570794de845414feae0ac38931cf5c04a34a80c3f012c7c55201ed8608bf01d9bdd069f37e8cf5f5c3290e906eeb5bfc9c261d8510e60')

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
