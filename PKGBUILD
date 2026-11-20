# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=jose
_pkgver=3.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="JavaScript Object Signing and Encryption"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-jsonlite
  r-openssl
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cbe0ee6b9792d4067252f181619cf81d')
b2sums=('e7401216feff6300dc85be71c63244ea261959a4075e9028e9bf668967305de678c10f08d15e6e329f95ed60ca43e72d8543d0dec7ee3aa3fc5004baaff1a98f')

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
