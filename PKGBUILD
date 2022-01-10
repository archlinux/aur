# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=knitr
_cranver=1.37
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A General-Purpose Package for Dynamic Report Generation in R"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL)
depends=(
    r-evaluate
    r-highr
    r-stringr
    r-yaml
    r-xfun
)
checkdepends=(r-rmarkdown r-testit r-tibble)
optdepends=(
    r-markdown
    r-formatr
    r-testit
    r-digest
    r-rgl
    r-codetools
    r-rmarkdown
    r-htmlwidgets
    r-webshot
    r-tikzdevice
    r-tinytex
    r-reticulate
    r-juliacall
    r-magick
    r-png
    r-jpeg
    r-gifski
    r-xml2
    r-httr
    r-dbi
    r-showtext
    r-tibble
    r-sass
    r-bslib
    r-ragg
    r-styler
    r-targets
    'pandoc: R Markdown v2 and reStructuredText support'
    'rst2pdf: rst2pdf() support'
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('39cd2a4848baebbe7fa0c0ab8200179690fb5b9190f0c1688d987c38363ad763')

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

check() {
  cd "${_cranname}/tests"
  R_LIBS="${srcdir}/build" _R_CHECK_PACKAGE_NAME_=false Rscript --vanilla run-all.R
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"
}
