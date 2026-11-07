# Maintainer: Kercy <kercyding@users.noreply.github.com>

pkgname=kocr-gui-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='Offline OCR for images (prebuilt GUI)'
arch=('x86_64' 'aarch64')
url='https://github.com/KercyDing/kocr'
license=('MIT')
depends=('glibc' 'gtk4' 'spectacle' 'kdialog' 'libnotify' 'wl-clipboard')
optdepends=(
    'gtk3: fallback when GTK 4 is not installed'
    'xclip: clipboard on X11 without wl-copy'
    'xsel: clipboard on X11 without wl-copy'
)
provides=('kocr-gui')
conflicts=('kocr-qt-bin' 'kocr-gtk-bin')

source_x86_64=(
    "kocr-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/kocr-${pkgver}-linux-amd64.tar.gz"
)
source_aarch64=(
    "kocr-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/kocr-${pkgver}-linux-arm64.tar.gz"
)
# The release workflow fills these from the release's .sha256 files.
sha256sums_x86_64=('f0d0c266f88013de389c95c3860889c24a0e4fa3c6589aa1a2efee8258812e21')
sha256sums_aarch64=('2be3cc3f0fa4bdd1a5d1e8297a7d360d889d65b5349ca5115e643831410e3991')

package() {
    local dir="kocr-${pkgver}"

    install -Dm755 "${srcdir}/${dir}/bin/kocr-gui" "${pkgdir}/usr/bin/kocr-gui"

    install -Dm644 "${srcdir}/${dir}/share/applications/kocr-gui.desktop" \
        "${pkgdir}/usr/share/applications/kocr-gui.desktop"
    for size in 16 32 128 256 512; do
        install -Dm644 "${srcdir}/${dir}/share/icons/hicolor/${size}x${size}/apps/kocr.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/kocr.png"
    done

    install -Dm644 "${srcdir}/${dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
