# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=shiny
_pkgver=1.12.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Web Application Framework for R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only AND MIT AND BSD-3-Clause AND Apache-2.0 AND GPL-2.0-or-later')
depends=(
  r-bslib
  r-cachem
  r-commonmark
  r-fastmap
  r-fontawesome
  r-glue
  r-htmltools
  r-httpuv
  r-jsonlite
  r-later
  r-lifecycle
  r-mime
  r-otel
  r-promises
  r-r6
  r-rlang
  r-sourcetools
  r-withr
  r-xtable
  r-cli
)
checkdepends=(
  r-coro
  r-future
  r-ggplot2
  r-otelsdk
  r-testthat
  ttf-font
)
optdepends=(
  r-cairo
  r-coro
  r-dt
  r-dygraphs
  r-future
  r-ggplot2
  r-knitr
  r-magrittr
  r-markdown
  r-ragg
  r-reactlog
  r-rmarkdown
  r-sass
  r-showtext
  r-testthat
  r-yaml
  r-mirai
  r-watcher
  r-otelsdk
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('10bbe8880aac8ad4336f8d83f9b36495')
b2sums=('d39a43ad1a30c66d4bb26ec8f09166a9a0e43637a36ebebf923051a9851a86b2482598c12936f8bbaf28202935eec39a0e44cb95143a38cb47d0288b46da8243')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
