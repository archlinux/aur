# Maintainer: Follen22 <baffer2024@gmail.com>
pkgname=ds5-edge-relay
pkgver=2.0.0
pkgrel=1
pkgdesc="Qt6 GUI relay daemon for DualSense Edge — presents it as standard DualSense to fix Proton/Steam compatibility, with a visual button-remapping editor"
arch=("x86_64")
url="https://github.com/Follen22/ds5-edge-relay"
license=("MIT")
depends=("glibc" "qt6-base")
makedepends=("cmake" "ninja")
install="${pkgname}.install"
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/Follen22/ds5-edge-relay/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=("8351d2b4a1baf93743fbd8af5b99ccdadb23ac712ccb94ed1160af7a9e8c3c6b")

build() {
    cd "${pkgname}-${pkgver}"
    cmake -B build -GNinja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    ninja -C build
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "build/${pkgname}"             "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "1.png"                        "${pkgdir}/usr/share/${pkgname}/1.png"
    install -Dm644 "99-${pkgname}.rules"          "${pkgdir}/usr/lib/udev/rules.d/99-${pkgname}.rules"
    install -Dm644 "${pkgname}.service"           "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
    install -Dm644 "${pkgname}.desktop"           "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 LICENSE                        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
