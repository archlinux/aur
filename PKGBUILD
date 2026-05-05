pkgname=mark-shot
pkgver=0.1.3
pkgrel=1
pkgdesc='Qt 6 Wayland screenshot selection and annotation tool'
arch=('x86_64')
url='https://github.com/jswysnemc/mark-shot'
license=('MIT')
depends=('qt6-base' 'qt6-wayland' 'layer-shell-qt' 'grim' 'wl-clipboard')
makedepends=('cmake' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b2c09ed2cb8bd205eb7176accf39eb6009a732230df12db26cf83e22e3a81c48')

build() {
    cmake -S "${pkgname}-${pkgver}" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
