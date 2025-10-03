# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: haha662 <haha662 at outlook dot com>

_pkgname=bookdown
_pkgver=0.45
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
md5sums=('2129ddf069a4788d872138291c028066')
b2sums=('725b094240229197ce5b2dc5bf75b09008fffb72143969d9ed9ae3e062b8ab21c1ed50eae833310cd793f8aa620b0c93170b108c181129db1242cae0e376db8b')

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
