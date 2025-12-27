# Maintainer: Rasmus Karlsson <rasmus.karlsson@pajlada.com>

pkgname=pajlada-serialize
pkgver=0.2.0
pkgrel=1
pkgdesc='c++ serialize/deserialize helper functions based on rapidjson'
arch=('any')
url=https://github.com/pajlada/serialize
license=('MIT')
makedepends=('git' 'cmake' 'gtest' 'rapidjson')
source=("git+https://github.com/pajlada/serialize.git#tag=v${pkgver}")
sha256sums=('fef0b41f447f93a416c707c01386ea98b9a4675a69c95ebaef20864ca5193a9a')

build() {
    cmake -S serialize \
        -B build \
        --fresh \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DPAJLADA_SERIALIZE_BUILD_TESTS=On
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 serialize/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
