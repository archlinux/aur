# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=deepseek-reasonix-desktop-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="DeepSeek-Reasonix Desktop - Electron-based desktop client for DeepSeek models"
arch=('x86_64')
url="https://github.com/esengine/DeepSeek-Reasonix"
license=('MIT')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'gcc-libs'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libcups'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
)
provides=('deepseek-reasonix-desktop' 'reasonix-desktop')
conflicts=('deepseek-reasonix-desktop' 'reasonix-desktop')
options=('!strip' '!debug')

_relurl="https://github.com/esengine/DeepSeek-Reasonix/releases/download/desktop-v${pkgver}"

source=(
    "Reasonix-linux-amd64.tar.gz::${_relurl}/Reasonix-linux-amd64.tar.gz"
    'reasonix-desktop.sh'
    'reasonix-desktop.desktop'
    "LICENSE::https://raw.githubusercontent.com/esengine/DeepSeek-Reasonix/main-v2/LICENSE"
)
sha256sums=(
    'd9cbaaeb566344499e0ee5ef9ff57d487050923b9a81e74c4ad86d18746109f6'
    'SKIP'
    'SKIP'
    'SKIP'
)

package() {
    # Upstream tarball contains only the reasonix-desktop binary (flat).
    # Install it into /opt/Reasonix
    install -d "${pkgdir}/opt/Reasonix"
    install -Dm755 "${srcdir}/reasonix-desktop" \
        "${pkgdir}/opt/Reasonix/reasonix-desktop"

    # Install wrapper script
    install -Dm755 "${srcdir}/reasonix-desktop.sh" \
        "${pkgdir}/usr/bin/reasonix-desktop"

    # Install .desktop entry
    install -Dm644 "${srcdir}/reasonix-desktop.desktop" \
        "${pkgdir}/usr/share/applications/reasonix-desktop.desktop"

    # Install license
    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
