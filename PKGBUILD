# Maintainer: Martin Diehl <aur@martin-diehl.net>
_cranname=robustHD
_cranver=0.8.3
pkgname=r-${_cranname,,}
pkgdesc="Robust Methods for High-Dimensional Data"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL2" "GPL3")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "r>=3.1.0"
    "r-ggplot2"
    "r-perry"
    "r-robustbase"
)
makedepends=()

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=('fab7607b5e50adf03604031f2c3ca260c7c895778492cc638689cf131ec36be407b66c80072ad2cfe375aef91f4cda91c82bc11bebda84f8456207fb16dcff15')

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
