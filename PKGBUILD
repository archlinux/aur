# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RCy3
_pkgver=2.30.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Functions to Access and Control Cytoscape"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-base64enc
  r-base64url
  r-biocgenerics
  r-fs
  r-glue
  r-gplots
  r-graph
  r-httr
  r-irdisplay
  r-irkernel
  r-rcolorbrewer
  r-rcurl
  r-rjsonio
  r-stringi
  r-uuid
  r-xml
)
optdepends=(
  r-biocstyle
  r-igraph
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9e3c28120a04587724bdf90dc0ecadd3')
b2sums=('762d6e600574ce9650ecf2243bff4ed44d2484b4d1e678086bcbf134bc29dd0e99330ad7dfc45656001106f9c740d4618fe7a6b0d4d3154980bca525f67e4ba7')

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
