# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mariner
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Explore the Hi-Cs"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=(GPL3)
depends=(
  r-abind
  r-assertthat
  r-biocgenerics
  r-biocmanager
  r-biocparallel
  r-colourvalues
  r-data.table
  r-dbscan
  r-delayedarray
  r-genomeinfodb
  r-genomicranges
  r-glue
  r-hdf5array
  r-interactionset
  r-iranges
  r-magrittr
  r-plotgardener
  r-plyranges
  r-progress
  r-purrr
  r-rcolorbrewer
  r-rhdf5
  r-rlang
  r-s4vectors
  r-strawr
  r-summarizedexperiment
)
checkdepends=(
  r-marinerdata
  r-testthat
)
optdepends=(
  r-dplyr
  r-experimenthub
  r-knitr
  r-marinerdata
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-test-snapshot.patch")
md5sums=('6ed30878d03b8a17e8e7c4ee17218893'
         'd0928c3ea11234e2200f31c9b4ff4ade')
b2sums=('dfaa195e26df395d9948668e342bcc5bc2c593d42b102a7140cb6778fc904f171b561c7fe1d6bce1dbefbd22832b745888549f06eff42c5596455d48e2693db3'
        'aba583ffb72fea9e7ce5820b8160418b345b87e1d93fe9533efeb5732011373bd18dfea4c16b49f869e0d698529f48f738bec528c77d67c1cf095e7656a6ca30')

prepare() {
  # fix snapshot test
  patch -Np1 -i fix-test-snapshot.patch
}

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
