# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=cpp-taskflow
_alt_pkgname=taskflow
pkgver=3.4.0
pkgrel=1
pkgdesc="Modern C++ Parallel Task Programming Library"
arch=('any')
url="https://github.com/taskflow/taskflow"
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('8f449137d3f642b43e905aeacdf1d7c5365037d5e1586103ed4f459f87cecf89')

prepare() {
    cd "${_alt_pkgname}-${pkgver}"
    cmake -H. -Bbuild \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DTF_BUILD_EXAMPLES=OFF
}

build() {
    cd "${_alt_pkgname}-${pkgver}"
    cmake --build build
}

check() {
    cd "${_alt_pkgname}-${pkgver}"
    cmake --build build -- test
}

package() {
    cd "${_alt_pkgname}-${pkgver}"
    cmake --build build -- DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
