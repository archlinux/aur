# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=immReferent
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An Interface for Immune Receptor and HLA Gene Reference Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biostrings
  r-httr
  r-jsonlite
  r-rvest
  r-tibble
  r-yaml
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-knitr
  r-mockery
  r-rmarkdown
  r-spelling
  r-testthat
  r-withr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4ec0215245c4136e4d9942ad5f8da588')
b2sums=('1d24ab367981e8ebb74eccfaea0ea3b11abcde7f9b95abd3256b50b8500119275b2d4c0e004f72fcce62371671e2d397b49b05a1444b3e96a4fb208cd516062c')

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
