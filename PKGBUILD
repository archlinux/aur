# Maintainer: Kercy <kercyding@users.noreply.github.com>

pkgname=kocr-gui-bin
pkgver=0.5.2
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
sha256sums_x86_64=('d1e99581dbaf4beb166f2c247cdf6a742128aa44c16eb4100f141bec6fa9c8f0')
sha256sums_aarch64=('33bffd9a6c0bf9201793e63e24c8ebab0376715de1e5882853eb816a01996dff')

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
