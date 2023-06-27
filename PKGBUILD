# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tidylog
_pkgver=1.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Logging for 'dplyr' and 'tidyr' Functions"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
depends=(
  r-clisymbols
  r-dplyr
  r-glue
  r-tidyr
)
checkdepends=(
  r-forcats
  r-testthat
)
optdepends=(
  r-bench
  r-covr
  r-forcats
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('17c4e3a5589ac9a1a0653ba54e979d52')
sha256sums=('67625de38920e1c3c9f6a996de4ef406a0d23eeef6d3b846e52630afc0a8ca1c')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
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
