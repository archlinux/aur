# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=logr
_pkgver=1.3.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Creates Log Files"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('CC0-1.0')
depends=(
  r-common
  r-withr
)
checkdepends=(
  r-dplyr
  r-testthat
  r-tidylog
)
optdepends=(
  r-covr
  r-dplyr
  r-knitr
  r-rmarkdown
  r-testthat
  r-tidylog
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9704c0941a7f36e2d5e105b2253f6c4f')
b2sums=('bdd10bb1e72bc3fe8e87a724d19f478be6b98155181553e1e72fb0d3f327a3af0fb3434288a517a55d4e1f165d58075a698452d746b6cf2b269665ed2f8fb2a9')

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
