# Contributor: SummerBreeze630 <xzwf2003 AT 163 DOT com>

_pkgbase=str
pkgname=wiz${_pkgbase}
pkgver=2025.7.1
pkgrel=1
pkgdesc="C++ string processing library"
arch=('x86_64' 'aarch64')
url="https://github.com/libbylg/str"
license=('MulanPSL-2.0')
depends=('gcc-libs')
makedepends=('cmake')
conflicts=("libstr-git")
_srcdir="${_pkgbase}-${pkgver}"
source=("${_srcdir}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ac86f1acb91ff562c60d8c3f93961742f6d3fbd329ce4147c80f6d92af4e57e3')
options=('staticlibs')

build() {
    mkdir -p build

    cmake -B build \
        -S "${_srcdir}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release

    cmake --build build \
        -j $(nproc)
}

package() {
    DESTDIR="${pkgdir}" \
        cmake --build build \
        --target install

    install -Dm644 "${_srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
