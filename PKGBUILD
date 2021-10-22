# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=rJava
_cranver=1.0-5
pkgname=r-${_cranname,,}
pkgdesc="Low-Level R to Java Interface"
url="https://cran.r-project.org/package=rJava"
license=("LGPL")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=("r" "java-environment")
optdepends=()
makedepends=()

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=("97aaf40756f84501c78382243cb93853")

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
