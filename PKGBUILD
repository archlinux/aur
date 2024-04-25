# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggbump
_pkgver=0.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Bump Chart and Sigmoid Curves"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-dplyr
  r-ggplot2
  r-purrr
  r-tidyr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1ec6860e19e80a6b489d12fcdb1b55c1')
b2sums=('4054ef101060d2b4208b6c8dd7b4dc611b65594136c1ec4c3220f0455f1f04809446f56e88dfb199d2b9928ff71d44116c24b4b4b34ce4c2b3c430ad1d144d83')

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
