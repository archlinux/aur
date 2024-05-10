# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HumanTranscriptomeCompendium
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools to work with a Compendium of 181000 human transcriptome sequencing studies"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocmanager
  r-s4vectors
  r-shiny
  r-ssrch
  r-summarizedexperiment
)
checkdepends=(
  r-biocfilecache
  r-rhdf5client
  r-testthat
)
optdepends=(
  r-beeswarm
  r-biocfilecache
  r-biocstyle
  r-dplyr
  r-dt
  r-knitr
  r-magrittr
  r-rhdf5client
  r-rmarkdown
  r-testthat
  r-tximport
  r-tximportdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('27bbd86aebf51ff0bfbfad400b80d69b')
b2sums=('078fedc4db598d81b05076b4f043e38b34d0e1ab9f6521d0c25f86b19d1dc811b61fd46a641b043ecaf090c609b87ca963a830c01cc51be3995e5a81b0daf44c')

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
