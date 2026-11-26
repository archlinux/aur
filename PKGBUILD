# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Summix
_pkgver=2.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Summix2: A suite of methods to estimate, adjust, and leverage substructure in genetic summary data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-bedassle
  r-dplyr
  r-magrittr
  r-nloptr
  r-randomcolor
  r-scales
  r-tibble
  r-tidyselect
  r-visnetwork
)
optdepends=(
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a00b55eef720b1d627d581b2146b719b')
b2sums=('cf8d2904540ab1285a8b82292a8c33c35f733ccb25d92e2f359a7527921d11edcfe8e31c928b39112f67fedb718ed8102b1520d6486811ae5ab006a36231fa29')

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
