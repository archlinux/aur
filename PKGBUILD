# Maintainer: Robert Greener <me@r0bert.dev>
# Contributor: haha662 <haha662 at outlook dot com>

_cranname=bookdown
_cranver=0.27
_updatedate=2022-06-25
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Authoring Books and Technical Documents with R Markdown"
arch=("any")
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL3")
depends=(
    "r"
    "pandoc>=1.17.2"
    "r-htmltools>=0.3.6"
    "r-knitr>=1.31"
    "r-rmarkdown>=2.13"
    "r-jquerylib"
    "r-xfun>=0.29"
    "r-tinytex>=0.12"
    "r-yaml>=2.1.19"
)
makedepends=(
    "r-testthat>=3.1.0"
    "r-testit>=0.9"
)
optdepends=(
    "r-bslib>=0.2.4"
    "r-downlit>=0.4.0"
    "r-htmlwidgets"
    "r-jsonlite"
    "r-rstudioapi"
    "r-miniui"
    "r-rsconnect>=0.4.3"
    "r-servr>=0.13"
    "r-shiny"
    "r-tibble"
    "r-testit>=0.9"
    "r-tufte"
    "r-xml2"
    "r-webshot"
    "r-testthat>=3.1.0"
    "r-withr>=2.3.0"
)
source=("https://cran.microsoft.com/snapshot/${_updatedate}/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha512sums=('1f65c8cd113cf9d5c1f53173e15576024457be890efcb809d3e84406a653c55b12f2c7364ca732f722a83b2948acec10755898ed5d38c8f2d7b371d594ece3ea')

build() {
  mkdir -p build

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build"
}

check() {
  cd "${_cranname}/tests"
  R_LIBS="${srcdir}/build" Rscript --vanilla testthat.R
  R_LIBS="${srcdir}/build" Rscript --vanilla test-all.R
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
