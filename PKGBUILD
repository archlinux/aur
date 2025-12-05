# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: haha662 <haha662 at outlook dot com>

_pkgname=bookdown
_pkgver=0.46
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Authoring Books and Technical Documents with R Markdown"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  pandoc
  r-htmltools
  r-jquerylib
  r-knitr
  r-rmarkdown
  r-tinytex
  r-xfun
  r-yaml
)
checkdepends=(
  r-downlit
  r-testthat
  r-xml2
)
optdepends=(
  r-bslib
  r-downlit
  r-htmlwidgets
  r-jsonlite
  r-miniui
  r-rsconnect
  r-rstudioapi
  r-servr
  r-shiny
  r-testit
  r-testthat
  r-tibble
  r-tufte
  r-webshot
  r-withr
  r-xml2
  r-curl
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8ef7fc385560c0a601e9d74d7a49c94b')
b2sums=('8225580a92f4d9ab7ad6169dbc29cc5fab2980fe7a25914846f216ff8a4547ffdddf86551574c81982428fd8ca452738e09f6382e59746849f8953fcef447f51')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

_check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
