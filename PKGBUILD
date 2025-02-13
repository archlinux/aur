# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Macarron
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Prioritization of potentially bioactive metabolic features from epidemiological and environmental metabolomics datasets"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocparallel
  r-data.table
  r-delayedarray
  r-dynamictreecut
  r-ff
  r-httr
  r-logging
  r-maaslin2
  r-plyr
  r-psych
  r-rjsonio
  r-summarizedexperiment
  r-wgcna
  r-xml2
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-markdown
  r-optparse
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('42cc3dae76d9f0e4ea9e838f8dd56c35')
b2sums=('40b7f4695384e8bf93a8481e180ebda53a2d3940ed6e0f794c7d5356c5cc6d2f3d5a467ec25c2652a741fa7cce8402f57e71923eca9611abf61dc1a8078025e0')

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
