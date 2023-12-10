# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Macarron
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Prioritization of potentially bioactive metabolic features from epidemiological and environmental metabolomics datasets"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
depends=(
  r-biocparallel
  r-data.table
  r-delayedarray
  r-dynamictreecut
  r-ff
  r-logging
  r-maaslin2
  r-plyr
  r-psych
  r-rcurl
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
md5sums=('525669e56fccd2be5524315ee6a0eafb')
sha256sums=('67a57809afc80049d12d83c82fdfed73d7cd1cf077da735a543f3dd38c46f6a7')

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
