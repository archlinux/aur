# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_cranname=palmerpenguins
_cranver=0.1.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Palmer Archipelago (Antarctica) Penguin Data"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(custom:CC0)
depends=(r)
optdepends=(
    r-knitr
    r-rmarkdown
    r-tibble
    r-ggplot2
    r-dplyr
    r-tidyr
    r-recipes
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz"
        "${_cranname}-LICENSE.md::https://raw.githubusercontent.com/allisonhorst/${_cranname}/v0.1.0/LICENSE.md")
sha256sums=('2a40d48ba6c7978fdf2a6daf647ccb39cd17590680138931d11194d3dd1a30b4'
            '8e2c443dd9aea6fcd6c293dbf66935bd5ef502fc0ca9b466c773cf9316d5e04c')

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"

  install -Dm644 "${_cranname}-LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
