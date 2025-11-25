# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=adbcdrivermanager
_pkgver=0.21.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="'Arrow' Database Connectivity ('ADBC') Driver Manager"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(Apache)
depends=(
  r-nanoarrow
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-testthat
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f037ac1cd593b18f9a53868aa8141ce4')
b2sums=('fa503e075bc456375c74a31a5d616cba536bf04adf47932bba263b5dc8916674ce506af02383bf801a1afcfd04c6414b3636fe5d8261bb4a6c73472ab993afd8')

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
}
