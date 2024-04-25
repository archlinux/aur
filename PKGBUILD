# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=jsonvalidate
_pkgver=1.3.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Validate 'JSON' Schema"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-v8
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-jsonlite
  r-knitr
  r-rmarkdown
  r-testthat
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('aeb5c0cc44825e0a9a8a5678e7eb5fe2')
b2sums=('93a5b5365d642a852c1a710009a6ed1c35a650fe3ca1acbd787889c07b85b3ba23817072edb5680b5b9527230dfdae7ec4ff1e3fb13aad36bb910139b8f7d8d0')

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
