# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rbowtie
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('409fc50371b1eaf9be2af500aff05249')
b2sums=('9cb33afde91eeedfd33db8f234821faa7f1dd0f3022f1b94c77845c94ece1ba3d68b02c660ef35f2e98facf788e3b24d656dd4eba5e5c15ccad388bd5dee83a8')

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
