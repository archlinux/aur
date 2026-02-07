# Maintainer: Rasmus Karlsson <rasmus.karlsson@pajlada.com>

pkgname=pajlada-settings
pkgver=0.5.0
pkgrel=1
pkgdesc='C++ Settings library'
arch=('any')
url=https://github.com/pajlada/settings
license=('MIT')
makedepends=('git' 'cmake' 'gtest' 'rapidjson' 'pajlada-serialize' 'pajlada-signals')
source=("git+https://github.com/pajlada/settings.git#tag=v${pkgver}")
sha256sums=('4ce5aadc3990c4fadec519d4ce9dc8ccf4c73e5dbbb9b135949c0ea6fb0c9c5e')

build() {
    cmake -S settings \
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
    install -Dm644 settings/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
