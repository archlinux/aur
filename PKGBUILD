# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SCATE
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Single-cell ATAC-seq Signal Extraction and Enhancement"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-genomicalignments
  r-genomicranges
  r-mclust
  r-preprocesscore
  r-rtsne
  r-scatedata
  r-splines2
  r-xgboost
)
optdepends=(
  r-ggplot2
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('877e80a925c1b76cc1a759dd7df2c788')
b2sums=('490aa800ec11584fa86940c011659fa0f0ae27cbedf66e9f2e087df429f7e09de093b14472ec6496192e261a9ef9d4e4d662d46c7969dabd595ea2cfb55bea0b')

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
