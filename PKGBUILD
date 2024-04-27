# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HiCExperiment
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Bioconductor class for interacting with Hi-C files in R"
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
md5sums=('98efc0440886cc84faef975a12f290a0')
b2sums=('95208adf3b22694141fa6ff6dc7e49d6ba492c75601da86685b31c6691e92e7ffd5ed3bd4ef06ea01ac68c64a55d26e799dcfef1420a11a01efbc7bea480781e')

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
