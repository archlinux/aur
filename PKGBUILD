# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HumanTranscriptomeCompendium
_pkgver=1.17.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Tools to work with a Compendium of 181000 human transcriptome sequencing studies"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-s4vectors
  r-shiny
  r-ssrch
  r-summarizedexperiment
)
checkdepends=(
  r-biocfilecache
  r-biocmanager
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
md5sums=('00689fd704a35eea4e0ba38516603b49')
b2sums=('8b74cc6ea362178bd614539615e2fe6e1b5738dc7e22f534136c861a9fe59ef9442c04ccf4f5ae34fcbefb3eda9ff72376117ee710b27f3179d8f00c185f1b4a')

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
