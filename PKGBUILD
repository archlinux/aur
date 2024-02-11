# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FCBF
_pkgver=2.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Fast Correlation Based Filter for Feature Selection"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-ggplot2
  r-gridextra
  r-mclust
  r-pbapply
  r-summarizedexperiment
)
optdepends=(
  r-biocmanager
  r-caret
  r-knitr
  r-mlbench
  r-rmarkdown
  r-singlecellexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ade7d75e811d9e4177e3e5f21dea6504')
b2sums=('8eee6f1ad7c5387fe6315d79fd8bf74cd6368f78056b2240d7b6d68418a4b847b73f2dd7c2032427ac873f2b505365a6f6d3c537976b7b4f7557f9c1e97e0613')

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
