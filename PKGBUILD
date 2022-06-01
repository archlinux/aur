# Maintainer: Robert Greener <me@r0bert.dev>
# Contributor: haha662 <haha662 at outlook dot com>

_cranname=bookdown
_cranver=0.26
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
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha512sums=('0619c64055d45598cafa2d5a4d4811faa8f32a43bf44987797649492374e3cdbcb607d558c910f49b32358f5aabd38fca6ff3b3067ef63aca7bada640074019c')

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
