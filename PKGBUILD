# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=zen4R
_pkgver=0.10.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Interface to 'Zenodo' REST API"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-cli
  r-httr
  r-jsonlite
  r-keyring
  r-plyr
  r-r6
  r-utf8
  r-xml
  r-xml2
)
optdepends=(
  r-atom4r
  r-knitr
  r-markdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('46b8e7e76c72ba26a10e3124de950da7')
b2sums=('a0bff0ad819f10f0b26689cfca6ff74dce7da0996758934c20012be095f99f7051c629a14495b97bb5ad934c92827a3420dc7b87e5f43729d5fb3723a364b77e')

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
