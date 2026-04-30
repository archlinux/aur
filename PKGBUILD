# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rbowtie
_pkgver=1.52.0
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
md5sums=('03e7cd339b3deeaa40ba55d77ef4df16')
b2sums=('3dffd051b85c837c7e83ea5ed842eb0abb81146ab4289b2841f4cdf4ba76d8d5a2711afcf63254362e757867a60ae1df22ff830bd1da2a7e2e16f8d05cb5dea3')

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
