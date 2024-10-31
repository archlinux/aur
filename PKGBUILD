# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rbowtie
_pkgver=1.46.0
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
md5sums=('ec35e70cc07cf7e6756c4598af50f07d')
b2sums=('06cd3b7c16318ead1a84e28a884ec261aea126a536f5b90763c8cab1b7bfe2cb671717d8f9df60d0e4f61cb0913f38ea1c7bb2bbff4abd78bf673aee9034065e')

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
