# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TissueEnrich
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tissue-specific gene enrichment analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-dplyr
  r-ggplot2
  r-gseabase
  r-summarizedexperiment
  r-tidyr
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('496e32b563c95db4b89eb278624ca163')
b2sums=('f74f52904bf44edb5cafe3bac4d4eeb9d29e5d63fb902e5d6ddafd2ed7481edc2946475b64c9ecf959779f4b84f2ce83480554077def3618dba7644f1263ce82')

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
