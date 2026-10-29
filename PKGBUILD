# Maintainer: Rakosn1cek <rakosn1cek@zohomail.eu>

pkgname=mise-browser-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Minimalist, privacy-focused, keyboard-centric web browser engineered for Linux"
arch=('x86_64')
url="https://github.com/Rakosn1cek/Mise-browser"
license=('GPL-3.0-or-later')
depends=(
    'alsa-lib'
    'gtk3'
    'libnotify'
    'libxss'
    'libxtst'
    'nss'
    'xdg-utils'
)
optdepends=(
    'kitty: clipboard-mediated terminal integration'
    'alacritty: clipboard-mediated terminal integration'
    'foot: clipboard-mediated terminal integration'
)
provides=('mise-browser')
conflicts=('mise-browser')
options=('!strip')
source_x86_64=("https://github.com/Rakosn1cek/Mise-browser/releases/download/v${pkgver}/mise-browser-${pkgver}.tar.gz")
source=(
    "mise-browser.desktop"
    "Mise-logo48.png"
    "Mise-logo128.png"
    "Mise-logo256.png"
)
sha256sums_x86_64=('54d26a665f70a45b4e8fdc13d9c11fadd678839a99038e646a25cd9796622abd')
sha256sums=(
    'e8c1c58f6e99c0e2db178b2a71038e6c8d1ce4e7d93afa84188e5e7d01d6d8bd'
    'ddef96e67b27c0d5e414b00eca783f6870035f355d1e951268b737b37bdaf068'
    'f881e5cedbe81c2b4b2bc197837412f97498a9f546ba7c624b228a71b7e7504a'
    '6e87df509f054c560f1e228193a8dbc181f39847f12a8e24f1da862fe62390ea'
)

package() {
    # Install binary distribution into /opt/mise-browser
    install -d "${pkgdir}/opt/mise-browser"
    cp -a "${srcdir}/mise-browser-${pkgver}/." "${pkgdir}/opt/mise-browser/"
    chmod 755 "${pkgdir}/opt/mise-browser/mise-browser"

    # Symlink executable to /usr/bin/mise-browser
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/mise-browser/mise-browser" "${pkgdir}/usr/bin/mise-browser"

    # Install desktop entry
    install -Dm644 "${srcdir}/mise-browser.desktop" "${pkgdir}/usr/share/applications/mise-browser.desktop"

    # Install application icons across standard resolutions
    install -Dm644 "${srcdir}/Mise-logo48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/mise-browser.png"
    install -Dm644 "${srcdir}/Mise-logo128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/mise-browser.png"
    install -Dm644 "${srcdir}/Mise-logo256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/mise-browser.png"

    # Install licence files
    install -Dm644 "${srcdir}/mise-browser-${pkgver}/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    install -Dm644 "${srcdir}/mise-browser-${pkgver}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
