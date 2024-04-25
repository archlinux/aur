# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Maaslin2
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="\"Multivariable Association Discovery in Population-scale Meta-omics Studies\""
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
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
md5sums=('0f92778b2d59935191e2ac58621da8f5')
b2sums=('12044401aa69766bed5624aa042dbd47ae0dbc5e7e10973367eb154f03079919be6be0dae23eec40daa1f0c24e1ba348db1f073f0c97b0c6bbd5fbc079370def')

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
