# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ANCOMBC
_pkgver=2.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Microbiome differential abudance and correlation analyses with bias correction"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-desctools
  r-doparallel
  r-dorng
  r-energy
  r-foreach
  r-gtools
  r-hmisc
  r-lme4
  r-lmertest
  r-multcomp
  r-nloptr
  r-quadprog
  r-rdpack
)
checkdepends=(
  r-microbiome
  r-testthat
)
optdepends=(
  r-dplyr
  r-dt
  r-knitr
  r-magrittr
  r-microbiome
  r-rmarkdown
  r-testthat
  r-tidyr
  r-tidyverse
  r-phyloseq
  r-mia
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
  r-treesummarizedexperiment
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('53eb2ddca4dff9679ddd52ed31ae1f4d')
b2sums=('f6b302fa7d0105ff80afcd9f14922d11aca10d36db7388a5c545ac7e9e230e3bbd9047d6ae1ad77faf34e9debe6c54c8dcee4d498bf857239c4f753c13dbb0f3')

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
