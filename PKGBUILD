# Maintainer: Anton Barchukov <anton@barchukov.com>
pkgname=limux-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="GPU-accelerated terminal workspace manager for Linux, powered by Ghostty's rendering engine (cmux port)"
arch=('x86_64')
url="https://github.com/am-will/limux"
license=('MIT')
depends=('gtk4' 'libadwaita' 'webkitgtk-6.0')
provides=('limux')
conflicts=('limux')
options=(!debug !strip)
source=("limux-${pkgver}.tar.gz::https://github.com/am-will/limux/releases/download/v${pkgver}/limux-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('3a6efd9316aaec34a33f5800cf933d37733e07879a8d7917682c677dc675772d')

package() {
    cd "limux-${pkgver}-linux-x86_64"

    install -Dm755 limux "${pkgdir}/usr/bin/limux"
    install -Dm755 lib/libghostty.so "${pkgdir}/usr/lib/libghostty.so"
    install -Dm644 share/applications/limux.desktop "${pkgdir}/usr/share/applications/limux.desktop"

    for size in 16x16 32x32 128x128 256x256 512x512; do
        install -Dm644 "share/icons/hicolor/${size}/apps/limux.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}/apps/limux.png"
    done

    find share/icons/hicolor/scalable -type f -name '*.svg' -exec \
        install -Dm644 {} "${pkgdir}/usr/{}" \;

    cp -r share/limux "${pkgdir}/usr/share/limux"
}
