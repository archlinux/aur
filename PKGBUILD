# Maintainer: Seunghun Kim <seunghunkim at proton dot me>
pkgname=clipcascade-bin
pkgver=3.5.1
pkgrel=1
pkgdesc="Sync clipboard across multiple devices"
arch=('x86_64')
url="https://github.com/Sathvik-Rao/ClipCascade"
license=('GPL-3.0-or-later')
depends=(
    'tk'
    'python'
    'python-pillow'
    'python-plyer'
    'python-pycryptodome'
    'python-pystray'
    'python-requests'
    'python-websocket-client'
    'python-xxhash'
    'python-pyfiglet'
    'python-prompt_toolkit'
    'python-keyring'
    'python-beautifulsoup4'
    'python-aiortc'
)
optdepends=('xclip: clipboard sync on Xorg sessions (REQUIRED on Xorg)'
            'wl-clipboard: clipboard sync on Wayland sessions (REQUIRED on Wayland)'
            'xorg-xwayland: tray icon on Wayland sessions (REQUIRED on Wayland)'
            'python-gobject: GTK-based clipboard monitor on X11'
            'gtk3: GTK-based clipboard monitor on X11'
            'noto-fonts-emoji: emoji glyphs in tray menu')
provides=('clipcascade')
conflicts=('clipcascade')
install=clipcascade-bin.install
source=(
    "ClipCascade_Linux-${pkgver}.zip::${url}/releases/download/v${pkgver}/ClipCascade_Linux.zip"
    "clipcascade-${pkgver}.svg::https://raw.githubusercontent.com/Sathvik-Rao/ClipCascade/refs/tags/v${pkgver}/logo/logo.svg"
    "clipcascade.desktop"
    "clipcascade.sh"
    "fix-write-path.patch"
)
sha256sums=('28291ebf340c09ec19fae6a82c482c6ea251ccdb66323c05b89a8b026bcfec4d'
            'b6bd10b3ea41fa8643947f3735256fb77b9d6e852736df61b13b0cb803d25d1e'
            '93e8a6c01a9454dc3bff053e46d44792a4d56687f94a24f534003d8a8dd77e4e'
            '7bf24291bf2b9ca51782c328ad37b35faea5b27c33f0bb1e6ef71c6744b4702d'
            'd6538f6ff962fd95bd2444a64cbd7ce5cdd442c914a0918bc5a5ccdcd39a58e6')

prepare() {
    cd "${srcdir}/ClipCascade"
    patch -p1 < "${srcdir}/fix-write-path.patch"
}

package() {
    install -dm755 "${pkgdir}/usr/share/clipcascade"
    cp -r "${srcdir}/ClipCascade/"* "${pkgdir}/usr/share/clipcascade/"
    rm -f "${pkgdir}/usr/share/clipcascade/LICENSE"

    install -Dm755 "${srcdir}/clipcascade.sh" "${pkgdir}/usr/bin/clipcascade"
    install -Dm644 "${srcdir}/ClipCascade/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/clipcascade.desktop" "${pkgdir}/usr/share/applications/clipcascade.desktop"
    install -Dm644 "${srcdir}/clipcascade-$pkgver.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/clipcascade.svg"
}
