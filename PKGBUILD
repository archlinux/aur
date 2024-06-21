# Maintainer: Adam Schadler <ajschadler@gmail.com>

_cranname=future.callr
_cranver=0.8.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Implementation of the Future API on top of the callr package"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('LGPL-2.1-or-later')
depends=(
    'r'
    'r-future>=1.33.0'
    'r-callr>=2.0.3'
)
makedepends=()
optdepends=(
    'r-globals'
    'r-future.apply'
    'r-listenv'
    'r-markdown'
    'r-r.rsp'
)
checkdepends=(${optdepends[@]})
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=('29d0f095658ea7481b4a4aab543b64a7e00b0120df42b6242c8ac7eb37701b6fea600e88e4cefbfe962e0b7189266fc747dc587d7618aa5332c71b6948941da1')

build() {
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

# Testing requires optional packages.
#check () {
#    R CMD check --no-manual -l "${srcdir}" "${_cranname}_${_cranver}.tar.gz"
#}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"

    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
