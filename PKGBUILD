# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lpsymphony
_pkgver=1.36.0
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
md5sums=('e953edb50a7949c359fd7d45248142df'
         '5fe82566bce5f45a9d9d8682e51ebfaa')
b2sums=('7e8febbb9208907c34e98269d74a67e453786bf1cafdde5d56a2fe4ed629fbe84654b4b71698d654892814bb6b1e001ac4586ee8f632178f3843b95045aa5c66'
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
