# Maintainer: gonwe <gonwex@gmail.com>
pkgname=doubao-desktop-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="Doubao AI Assistant - Tauri-based native desktop wrapper (ByteDance)"
arch=('x86_64')
url="https://github.com/gonwe/doubao-desktop"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3' 'glib2' 'libgl' 'hicolor-icon-theme')
makedepends=()
optdepends=()
provides=("doubao-desktop=${pkgver}")
conflicts=('doubao-desktop')

_dlname="doubao-desktop-${pkgver}-x86_64.tar.gz"
source=("${_dlname}::https://github.com/gonwe/doubao-desktop/releases/download/v${pkgver}/${_dlname}"
        "${pkgname}.desktop")
sha256sums=('77f56795baf3819a0fe2aeda2abdaf0a220fd6ec3d1403229436bad48804b3c2'
            'SKIP')

package() {
    cd "$srcdir"
    _srcdir="doubao-desktop-${pkgver}-x86_64"

    # Launcher wrapper script (Wayland compatibility)
    install -Dm755 "${_srcdir}/doubao-desktop" "$pkgdir/usr/bin/doubao-desktop"

    # Tauri binary
    install -Dm755 "${_srcdir}/doubao-desktop.bin" "$pkgdir/usr/bin/doubao-desktop.bin"

    # Desktop entry
    install -Dm644 "${pkgname}.desktop" "$pkgdir/usr/share/applications/doubao-desktop.desktop"

    # PNG icon
    install -Dm644 "${_srcdir}/doubao-desktop.png" \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/doubao-desktop.png"
}
