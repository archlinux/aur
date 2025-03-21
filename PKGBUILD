# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=spatialLIBD
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="an R/Bioconductor package to visualize spatially-resolved transcriptomics data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationhub
  r-benchmarkme
  r-biocfilecache
  r-biocgenerics
  r-cowplot
  r-dt
  r-edger
  r-experimenthub
  r-fields
  r-genomicranges
  r-ggplot2
  r-golem
  r-iranges
  r-jsonlite
  r-limma
  r-magick
  r-matrixgenerics
  r-paletteer
  r-plotly
  r-png
  r-rcolorbrewer
  r-rlang
  r-rtracklayer
  r-s4vectors
  r-scater
  r-scuttle
  r-sessioninfo
  r-shiny
  r-shinywidgets
  r-singlecellexperiment
  r-spatialexperiment
  r-statmod
  r-summarizedexperiment
  r-tibble
  r-viridislite
  r-dplyr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-covr
  r-dropletutils
  r-here
  r-knitr
  r-lobstr
  r-refmanager
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-tests.patch")
md5sums=('a261eafe19ca77ff46ca694974b64923'
         'ff2fc6d00615921ec62383cabcea1afb')
b2sums=('6ebf05315d1122b3bc32fce1d157caa0c0fe8eaf2d30508b6e88c46d53e452b9ccf82cb9dda81d30530093b7133dcfe585899de90b86fa9fd0bdc53289e5571d'
        '637e4f2e31c0e77dfefacffd24c5e8a90b3bc70b36d68ec2fffebc41ca0bafe94707f02e67d42f22497d354a36b91157219d795661e80c173361fd33b20ae523')

#prepare() {
  # skip failing tests
#  patch -Np1 -i fix-tests.patch
#}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

#check() {
#  cd "$_pkgname/tests"
#  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
#}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
