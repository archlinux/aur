# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HiCExperiment
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bioconductor class for interacting with Hi-C files in R"
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
  r-interactionset
  r-iranges
  r-rhdf5
  r-s4vectors
  r-strawr
  r-vroom
)
checkdepends=(
  r-hicontactsdata
  r-testthat
)
optdepends=(
  r-biocfilecache
  r-biocstyle
  r-hicontacts
  r-hicontactsdata
  r-knitr
  r-rmarkdown
  r-rtracklayer
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9208ad11b1c8c4b78cfd51e1f02c0c6e')
sha256sums=('39e8d6ec871c78eb179a47108e7a6d4a9f35f7c098cad45f8e5cf65f512717c9')

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
