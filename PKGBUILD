# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com>

pkgname=openmeters
pkgver=1.15.0
pkgrel=1
pkgdesc="Fast and professional audio metering/visualization for Linux."

arch=("x86_64")
url="https://github.com/httpsworldview/openmeters"
license=("GPL-3.0-or-later")
depends=("pipewire" "wayland" "libxkbcommon" "vulkan-icd-loader")
makedepends=("git" "cargo" "pkgconf" "pipewire" "clang")
provides=("openmeters")
conflicts=("openmeters")
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=("645cee54965296e7484e124316c803d46640589c23ca280597848c9b3aa65b51")

build() {
    cd "${srcdir}/openmeters"
    cargo build --locked --release
}

package() {
    cd "${srcdir}/openmeters"
    install -Dm755 target/release/openmeters "${pkgdir}/usr/bin/openmeters"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 misc/openmeters.desktop "${pkgdir}/usr/share/applications/openmeters.desktop"
    install -Dm644 misc/openmeters.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/openmeters.svg"
}
