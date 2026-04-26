# Maintainer: Rasmus Karlsson <rasmus.karlsson@pajlada.com>

pkgname=pajlada-signals
pkgver=0.1.3
pkgrel=1
pkgdesc='simple C++ signal library'
arch=('any')
url=https://github.com/pajlada/signals
license=('MIT')
makedepends=('git' 'cmake' 'gtest')
source=("git+https://github.com/pajlada/signals.git#tag=v${pkgver}")
sha256sums=('fe25ac457eec4fb8862ed8461cbbd557294c7b02910a967312db17c13a42accd')

build() {
    cmake -S signals \
        -B build \
        --fresh \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 signals/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
