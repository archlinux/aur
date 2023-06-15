# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Maaslin2
_pkgver=1.14.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='"Multivariable Association Discovery in Population-scale Meta-omics Studies"'
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
depends=(
  r-biglm
  r-car
  r-chemometrics
  r-cplm
  r-data.table
  r-dplyr
  r-edger
  r-ggplot2
  r-glmmtmb
  r-hash
  r-lme4
  r-lmertest
  r-logging
  r-metagenomeseq
  r-optparse
  r-pbapply
  r-pcapp
  r-pheatmap
  r-pscl
  r-robustbase
  r-tibble
  r-vegan
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7f70167c230537ebff1f132b2a2d46bf')
sha256sums=('06322770bf1658946a0e7cedc1d1e1731954c55ad88fb359740dc6bfa038ab1a')

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
