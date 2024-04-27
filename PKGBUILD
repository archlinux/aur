# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HiContacts
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Analysing cool files in R with HiContacts"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocgenerics
  r-biocio
  r-biocparallel
  r-dplyr
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-ggrastr
  r-hicexperiment
  r-interactionset
  r-iranges
  r-readr
  r-rspectra
  r-s4vectors
  r-scales
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
)
checkdepends=(
  r-bsgenome.scerevisiae.ucsc.saccer3
  r-hicontactsdata
  r-rfast
  r-testthat
  r-wgcna
)
optdepends=(
  r-biocstyle
  r-biostrings
  r-bsgenome.scerevisiae.ucsc.saccer3
  r-genomicfeatures
  r-hicontactsdata
  r-knitr
  r-patchwork
  r-rfast
  r-rmarkdown
  r-rtracklayer
  r-terra
  r-testthat
  r-wgcna
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f7f7341e5b4cbfcd13b04fadd9c472c7')
b2sums=('607119810196bdb7083dd1eb674089b1246c3865c8ba8fb1278bc7fabe7117f66271d9af9130b380f7b7bf496619cfe2f90463253a42f4d36026082434b565e5')

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
