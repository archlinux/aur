# Maintainer: Pppp1116 <pcaiadoguerreiro@gmail.com>

pkgname=defer-hpp
pkgver=0.1.0
pkgrel=1
pkgdesc='Tiny C++20 header-only scope guard for local cleanup'
arch=('any')
url='https://github.com/Pppp1116/defer-in-Cpp'
license=('MIT')
makedepends=('cmake')
_commit='bd236fcd31582de0f7146d5c641d68493dc3051c'
source=("${pkgname}-${pkgver}-${_commit}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('c24fdd404a561b3991aa41f4e515d67dfb0533e8257850b4b49476962c2c57ed')

build() {
    cmake -B build -S "defer-in-Cpp-${_commit}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_INSTALL_DOCDIR="share/doc/${pkgname}" \
        -DDEFER_HPP_BUILD_EXAMPLES='OFF' \
        -DBUILD_TESTING='ON' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "defer-in-Cpp-${_commit}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -rf "${pkgdir}/usr/share/licenses/defer_hpp"
}
