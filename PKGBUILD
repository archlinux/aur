# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=breakpointRdata
_pkgver=1.32.0
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
md5sums=('f46742802ac0777ff09d61cae0831d8b')
b2sums=('9d5ef1849d01bc36c9beaadbde583a8c68cee2bed11de7baae1722c952a22b4b355c6de661af7b484c0599ea92ba0679b9b5a7eddf5e36881fa0045d3c91cf0d')

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
