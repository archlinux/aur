# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mariner
_pkgver=1.8.0
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
md5sums=('e7c2fc79a3d5cc581556498d085287c8'
         'b055713d876d7ea3e97a92a152bb5f28')
b2sums=('70fd934168bd3c6f3016a6126b8e92827c20f97268752438e65e61be9ec20354d3161b40228e5f79a5f25f26ec2b7e44ba5c4e69670287501f318d44b5ab4e3b'
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
