# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mbQTL
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="mbQTL: A package for SNP-Taxa mGWAS analysis"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
depends=(
  r-broom
  r-dplyr
  r-ggplot2
  r-matrixeqtl
  r-metagenomeseq
  r-pheatmap
  r-readxl
  r-stringr
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5b8464d079a9297ed19fcdfade113190')
sha256sums=('501e5ac9d5faa96cef0efa5469e679fd5fbb04e608a8940adab7b8d764ae4706')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
