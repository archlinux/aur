# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Maaslin2
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('cb1e84fccfdb6eda73a03ef743aa9270')
b2sums=('d4cde9c3d6f460e415577b4e04bd118831a5b0d4b70d5a23f6deed093fdb7abb00a5fdc72548c7c8c6d2e356f2040bbaf2470ef861ade554f34fee46843267fe')

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
