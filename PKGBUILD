# Maintainer: Martin Diehl <aur@martin-diehl.net>
_cranname=perry
_cranver=0.3.1
pkgname=r-${_cranname,,}
pkgdesc="Resampling-Based Prediction Error Estimation for Regression Models"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL2" "GPL3")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "r>=3.1.0"
    "r-ggplot2"
)
makedepends=()

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=('dd465954d38db061d6f37fa8ad25dc1a2489ade691ba82178ad2e03cd963e017eaf9c8a0257e28b2b68e6c5526c2319d084225e3a18efe72d46605e0b04577f7')

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
