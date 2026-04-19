# Maintainer: Christos Longros <chris.longros@gmail.com>
_cranname=ankiR
_cranver=0.6.6
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="Comprehensive R Toolkit for Anki Flashcard Analysis (137 functions)"
arch=('any')
url="https://github.com/chrislongros/ankiR"
license=('MIT')
depends=(r r-jsonlite r-dbi r-rsqlite r-tibble)
optdepends=(
  'r-testthat: testing'
  'r-knitr: vignettes'
  'r-rmarkdown: vignettes'
  'r-ggplot2: plotting functions'
  'r-shiny: interactive dashboard'
)
source=("${_cranname}-${_cranver}.tar.gz::https://github.com/chrislongros/ankiR/archive/refs/tags/v${_cranver}.tar.gz")
sha256sums=('1ed093e9685d8716183dc39a4b803f614eca0af4438da048636e5ef71f9e0ecf')
build() {
  cd "${srcdir}/${_cranname}-${_cranver}"
  R CMD build .
}
package() {
  install -dm755 "${pkgdir}/usr/lib/R/library"
  cd "${srcdir}/${_cranname}-${_cranver}"
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${pkgdir}/usr/lib/R/library"
}
