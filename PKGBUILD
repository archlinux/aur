_pkgname=nanopb
pkgname=${_pkgname}-git
pkgver=r912.0ffccc4
pkgrel=1
pkgdesc='Protocol Buffers with small code size'
arch=('i686' 'x86_64')
url=https://github.com/nanopb/nanopb
license=('zlib')
depends=()
makedepends=('cmake' 'git')
source=('git+https://github.com/nanopb/nanopb.git')
md5sums=('SKIP')

prepare() {
    mkdir -p "${srcdir}/${_pkgname}/build"
}

pkgver() {
    cd "${srcdir}/${_pkgname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}/build"

    cmake .. -DCMAKE_INSTALL_PREFIX=${pkgdir}
    make
}

package() {
    cd "${srcdir}/${_pkgname}/build"

    make install

    mkdir -p "${pkgdir}/usr"
    mv "${pkgdir}/include" "${pkgdir}/usr/include"
    mv "${pkgdir}/lib" "${pkgdir}/usr/lib"
}
