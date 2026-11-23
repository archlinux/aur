# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=Vicus
_pkgver=0.99.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Exploiting Local Structures to Improve Network-Based Analysis of Biological Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-rann
  r-rspectra
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-scatterplot3d
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3be479ec81a40a4d94ecc3e7753a6898')
b2sums=('71a0c129bf7a0aefb25ef66375b5d3542864217b256add1432ebf8129c89240ae836e9326c77c5841b7dbd1cd884bc10bb14494b922220d6039bdae1bfa1c3e7')

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
