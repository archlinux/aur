# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rmzqc
_pkgver=0.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Creation, Reading and Validation of 'mzqc' Files"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-jsonlite
  r-jsonvalidate
  r-knitr
  r-ontologyindex
  r-r6
  r-r6p
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a1251a1207219d86d6c8b853453565ac')
b2sums=('b5d0a05d88e491e32971fd262eb2d485edd765d3a9f0ec4d08bccffe451b8cace0b8050745232b42bf5d0b3d9f23ea5d582fead8c22c7101038c3521035268dd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
