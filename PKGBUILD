# Maintainer: Benjamim Gois <benjamimgois@gmail.com>
pkgname=serialcom
pkgver=1.0
pkgrel=1
pkgdesc="Modern graphical interface for serial communication via picocom"
arch=('any')
url="https://github.com/benjamimgois/serialcom"
license=('MIT')
depends=('python' 'python-pyqt6' 'qt6-serialport' 'picocom' 'sudo')
makedepends=('imagemagick')
optdepends=(
    'gnome-terminal: default terminal emulator'
    'konsole: KDE terminal emulator'
    'xfce4-terminal: XFCE terminal emulator'
    'kitty: fast GPU-based terminal emulator'
    'alacritty: cross-platform GPU-accelerated terminal emulator'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/benjamimgois/serialcom/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install main script
    install -Dm755 serialcom "${pkgdir}/usr/bin/serialcom"

    # Install icon in hicolor theme (FreeDesktop.org standard) - multiple sizes
    install -Dm644 serialcom.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/serialcom.png"

    # Create scaled versions for better compatibility
    for size in 256 128 64 48 32 16; do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
        magick serialcom.png -resize ${size}x${size} "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/serialcom.png"
    done

    # Install SVG arrow icon
    install -Dm644 arrow_down.svg "${pkgdir}/usr/share/serialcom/arrow_down.svg"

    # Install desktop file
    install -Dm644 serialcom.desktop "${pkgdir}/usr/share/applications/serialcom.desktop"

    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 INTERFACE.md "${pkgdir}/usr/share/doc/${pkgname}/INTERFACE.md"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
