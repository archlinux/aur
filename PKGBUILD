# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=breakpointRdata
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Strand-seq data for demonstration purposes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fa35347f784cb59fcdb71533c2ed892d')
b2sums=('e49f7f9250939efb62023debaaf05f9faa481c09b84cbaa025d612e9c6b1b9a78ede58341b5272dbeeb5d2b55151e4689a2bcc0e95c9f0f08d2ba72b1bac62a1')

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
