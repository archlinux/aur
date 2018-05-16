# Maintainer: Matthew T Hoare <matthew.t.hoare dot gmail at com>

_pkgname='pbrt-v3'
pkgname="${_pkgname}-git"
pkgver=r677.63a0699
pkgrel=1
pkgdesc="Physically based rendering system"
arch=('x86_64')
url="pbrt.org"
license=('BSD')
depends=('zlib' 'gcc-libs')
makedepends=('cmake' 'git')
source=("${_pkgname}::git+https://github.com/mmp/${_pkgname}#branch=master")
md5sums=('SKIP')

pkgver() {
        cd "${_pkgname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "${_pkgname}"
        git submodule update --init --recursive
        mkdir build
        cd build
        cmake ../
        make
}

package() {
        cd "${srcdir}"
        install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
        install -Dm 644 "${_pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        install -Dm 755 "${_pkgname}/build/pbrt" "${pkgdir}/usr/bin/pbrt"
        install -Dm 755 "${_pkgname}/build/obj2pbrt" "${pkgdir}/usr/bin/obj2pbrt"
        install -Dm 755 "${_pkgname}/build/imgtool" "${pkgdir}/usr/bin/imgtool"
}

