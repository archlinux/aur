# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ENmix
_pkgver=1.42.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Quality control and analysis tools for Illumina DNA methylation BeadChip"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationhub
  r-biobase
  r-doparallel
  r-dynamictreecut
  r-experimenthub
  r-foreach
  r-genefilter
  r-geneplotter
  r-gplots
  r-gtools
  r-illuminaio
  r-impute
  r-iranges
  r-irlba
  r-matrixstats
  r-minfi
  r-quadprog
  r-rpmm
  r-s4vectors
  r-summarizedexperiment
)
checkdepends=(
  r-biocgenerics
  r-minfidata
  r-runit
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-minfidata
  r-rmarkdown
  r-runit
)
source=("https://www.bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dfc2fd60884b445f84c3bb5f906ea9bd')
b2sums=('91d4b11618987ac55fe59915a7e8ee3c1aa80a1380b3c91e9531090e965fe07ba98a7c30c8f38741efa3849394e854ba1cf2a2b56cc349190dbbea5c54b93e92')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
