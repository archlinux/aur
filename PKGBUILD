# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mariner
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Explore the Hi-Cs"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
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
md5sums=('59fce5faa48236d0a9cd9bdda6480d3d'
         'b055713d876d7ea3e97a92a152bb5f28')
b2sums=('e2c553258972c7d24b907feab042be3fce9547636a6fbb1c264148002928b48fec581504e8281c214d076bdca3933eda08f9df6ad6f7b0d74d1e3847e8bee75f'
        '6111457fda4b526e70b08ac62ec1ffd68dd8fe81d6d57cd715ef4f10a5156756d788043a924d9b3103958775cc28d02e0313947187a571907a9f6adf879148a1')

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
