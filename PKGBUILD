# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PhIPData
_pkgver=1.12.0
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
md5sums=('b49addead15f0f531e89c8ec5471eda4')
b2sums=('78e65ee7d860b3350a74ca7a7df9b444e5d427066ae8859549447e58ea50eaafe9f5947895934035b5579f41d7550bd5685a6af0dc457030a8ea4b92841a2952')

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
