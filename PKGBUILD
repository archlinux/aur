# Maintainer: Anton Barchukov <anton@barchukov.com>
pkgname=limux-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="GPU-accelerated terminal workspace manager for Linux, powered by Ghostty's rendering engine (cmux port)"
arch=('x86_64')
url="https://github.com/am-will/limux"
license=('MIT')
depends=('gtk4' 'libadwaita' 'webkitgtk-6.0')
provides=('limux')
conflicts=('limux')
source=("limux-${pkgver}.tar.gz::https://github.com/am-will/limux/releases/download/v${pkgver}/limux-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
    cd "limux-${pkgver}-linux-x86_64"

    # binary
    install -Dm755 limux "${pkgdir}/usr/bin/limux"

    # shared library
    install -Dm755 lib/libghostty.so "${pkgdir}/usr/lib/libghostty.so"

    # desktop entry
    install -Dm644 share/applications/limux.desktop "${pkgdir}/usr/share/applications/limux.desktop"

    # icons
    for size in 16x16 32x32 128x128 256x256 512x512; do
        install -Dm644 "share/icons/hicolor/${size}/apps/limux.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}/apps/limux.png"
    done

    # scalable icons
    find share/icons/hicolor/scalable -type f -name '*.svg' -exec \
        install -Dm644 {} "${pkgdir}/usr/{}" \;

    # ghostty data (themes, shell integration, docs)
    cp -r share/limux "${pkgdir}/usr/share/limux"
}
