# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=ieugwasr
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Interface to the 'OpenGWAS' Database API"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-dplyr
  r-httr
  r-jsonlite
  r-magrittr
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e294f461d44953e8f35ef5f5f7302656')
b2sums=('78217f5f07002125c86ee721d2323c727efddc590d3787e35fe41a3774511f3c62c0a9a3d05f43a8c9a4e785391a7317344990b311101f0d5ff7f943ab1837be')

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
