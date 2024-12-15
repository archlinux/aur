# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PhIPData
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Container for PhIP-Seq Experiments"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocfilecache
  r-biocgenerics
  r-cli
  r-edger
  r-genomicranges
  r-iranges
  r-s4vectors
  r-summarizedexperiment
)
checkdepends=(
  r-readr
  r-testthat
)
optdepends=(
  r-biocstyle
  r-covr
  r-dplyr
  r-knitr
  r-readr
  r-rmarkdown
  r-testthat
  r-withr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5d5422da85869a7cae252e397a1746b5')
b2sums=('c59eb37881e47cf38d7c50abc61b2ad9dba643b6bf2c7da15675a94bafbc2c8f0b81f67d1e5f617acad15b153bdaae63b6fcd8d074ac2bce1909cfc1fa7e8eab')

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
