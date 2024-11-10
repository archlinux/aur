# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HiContacts
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('04024808b535cef83529e36f47032b54')
b2sums=('0780302845de4f255a1d53433ec2f259d38d8de02c29069ecf9bac07d4a9160b83fa994f22030bcae18a6b0b114da0b0f528544e52bccf6d11d03c701de710e1')

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
