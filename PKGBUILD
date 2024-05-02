# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rbowtie
_pkgver=1.44.0
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
md5sums=('cb1691e970b9ef899bac366baa3e9bb5')
b2sums=('5abc324d1b774274bd553674021c8e400e3dd15bdcb08e3f92f2a85f97aa570eaf6ae852bb0b31527be4d1d99e67e2c0145098e7b79202e7dde132543cab8936')

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
