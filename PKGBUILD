# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lpsymphony
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Symphony integer linear programming solver in R"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=(EPL)
depends=(
  coin-or-symphony
  r
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "system-symphony.patch")
md5sums=('b98d6f231cb9a805093cf2384c2858e0'
         '5fe82566bce5f45a9d9d8682e51ebfaa')
b2sums=('24906394b869dddf24335a9e87876af562e672d1e8e5230bd042c8cd199705b584167e1c894168a3be86c30678b295d25ac1fbeb02b333d45f857c10ff7af256'
        '86b91dad7e7979ff31b83a876c5fb64f626b8dbddc389e2e91ba206c9644f88ad482d6bd8e4b2bfd841fc8d4fd8e00bc6e7529645bae75e4af18eef1fb5ce022')

#prepare() {
  # build against system SYMPHONY
#  patch -Np1 -i system-symphony.patch
#}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

#check() {
#  cd "$_pkgname/tests"
#  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
#}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
