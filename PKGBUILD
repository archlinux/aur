# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_cranname=magick
_cranver=2.7.3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="Advanced Graphics and Image-Processing in R"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=(
    imagemagick
    r-rcpp
    r-magrittr
    r-curl
)
optdepends=(
    r-av
    r-spelling
    r-jsonlite
    r-knitr
    r-rmarkdown
    r-rsvg
    r-webp
    r-pdftools
    r-ggplot2
    r-gapminder
    r-irdisplay
    r-tesseract
    r-gifski
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz"
        "CRAN-MIT-TEMPLATE::https://cran.r-project.org/web/licenses/MIT")
sha256sums=('83877b2e23ea43fbc1164de9c2422eafbe7858393ac384df5adf3a7eec122441'
            'e76e4aad5d3d9d606db6f8c460311b6424ebadfce13f5322e9bae9d49cc6090b')

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

check() {
  cd "${_cranname}/tests"
  R_LIBS="${srcdir}/build" Rscript --vanilla encoding.R
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"

  install -Dm644 CRAN-MIT-TEMPLATE "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
  install -Dm644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
