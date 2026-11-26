# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lpsymphony
_pkgver=1.42.0
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
md5sums=('b621fcad40d7ec12e5071088c0c24760'
         '5fe82566bce5f45a9d9d8682e51ebfaa')
b2sums=('a833b44198cf577f8c090b3c29b74dc3dda0e2097d68a8c4031f36851203830b623a25fb650daeccd25ab053191ad98addf0feb8e49aa509518db5eee16fdcee'
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
