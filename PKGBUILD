# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=MPO.db
_pkgver=0.99.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A set of annotation maps describing the Mouse Phenotype Ontology"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
  r-annotationhub
  r-biocfilecache
  r-dbi
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fd9bff2a147bbef37b58cef85ec79488')
b2sums=('903d10d976be9c9a0a0d1cb07024c9696357ae85c45757c3b31b3f98e80398353fb472c021d918a38f3a1757333072cdda1a0f386c55d78ca71652a57e66c4c9')

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
