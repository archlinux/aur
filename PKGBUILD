# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HiContacts
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analysing cool files in R with HiContacts"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
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
sha256sums=('7efd2cc7f77c82fe4e2b662fc54f093d68ee045c4d89c0f2400a4409bcf5ab29')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
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
