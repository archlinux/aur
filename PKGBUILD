# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RCy3
_pkgver=2.24.0
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
md5sums=('df17ff1400cb31df13573a0abfcf7986')
b2sums=('084753ef00fdfef14b5413b8a4e73833c5fa35cb3cad9b1d5aa65d064231d839ed5e9e0d8ed028700e2b082d862cc41fad62ff03489fa8475150314fadd00098')

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
