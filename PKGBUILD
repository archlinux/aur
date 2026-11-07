# Maintainer: Kercy <kercyding@users.noreply.github.com>

pkgname=kocr-gui-bin
pkgver=0.5.1
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
sha256sums_x86_64=('526a7f2a228c66fa8c8a02942fbb2395311257c64f1f0f8b705e116475b38a7c')
sha256sums_aarch64=('2bb266d382548b131879562873a2e72aaeac8bd249c38db52d23c32658b037b6')

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
