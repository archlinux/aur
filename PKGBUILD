# Maintainer: Follen22 <baffer2024@gmail.com>
pkgname=ds5-edge-relay
pkgver=1.0.0
pkgrel=1
pkgdesc="HID relay daemon for DualSense Edge to virtual DualSense, fixes Proton compatibility"
arch=("x86_64")
url="https://github.com/Follen22/ds5-edge-relay"
license=("MIT")
depends=("glibc")
makedepends=("cmake" "ninja")
install="${pkgname}.install"
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/Follen22/ds5-edge-relay/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=("f38d462f79d33ea50c56af8ddfacdc1ee0717dbbc6e64bf361f61275f1186ecb")

build() {
    cd "${pkgname}-${pkgver}"
    cmake -B build -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    ninja -C build
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
