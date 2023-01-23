# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_cranname=vctrs
_cranver=0.5.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Vector Helpers"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=(
    "r>=3.3"
    "r-cli>=3.4.0"
    "r-glue"
    "r-lifecycle>=1.0.3"
    "r-rlang>=1.0.6"
)
optdepends=(
  "r-bit64"
  "r-covr"
  "r-crayon"
  "r-dplyr>=0.8.5"
  "r-generics"
  "r-knitr"
  "r-pillar>=1.4.4"
  "r-pkgdown>=2.0.1"
  "r-rmarkdown"
  "r-testthat>=3.0.0"
  "r-tibble>=3.1.3"
  "r-withr"
  "r-xml2"
  "r-waldo>=0.2.0"
  "r-zeallot"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("e93b779b8431bda187afc3cee5658b698100cb6f2cb497f173bb67f420b1c807be58920bb2c76ba2dff6a2958291ab97d5aa60ec2f7bedc433170b4a845e6cab")

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"

  if [[ -f "${_cranname}/LICENSE" ]]; then
    install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi

}
