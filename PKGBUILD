# Maintainer: gonwe <gonwex@gmail.com>
pkgname=chatgpt-webapp-desktop-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Unofficial ChatGPT desktop wrapper for Linux (Tauri)"
arch=('x86_64')
url="https://github.com/gonwe/chatgpt-webapp"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3' 'glib2' 'libgl' 'hicolor-icon-theme')
makedepends=()
optdepends=('noto-fonts-cjk: CJK system font' 'adobe-source-han-sans-cn-fonts: CJK system font')
provides=("chatgpt-webapp-desktop=${pkgver}")
conflicts=('chatgpt-webapp-desktop')

_dlname="chatgpt-webapp-desktop-bin-${pkgver}-x86_64.tar.gz"
source=("${_dlname}::https://github.com/gonwe/chatgpt-webapp/releases/download/v${pkgver}/${_dlname}"
        "${pkgname}.desktop")
sha256sums=('8c8d183fe719d79544fd9ee867cbb636de57c30dbcad7141a12775ce00f1a08b'
            '94fec67e076eef5a7f7d0c688af548255a5d897e6be7e7ac7c18ca8694575549')

package() {
    cd "$srcdir"
    _srcdir="chatgpt-webapp-desktop-bin-${pkgver}-x86_64"

    install -Dm755 "${_srcdir}/chatgpt-webapp-desktop" "$pkgdir/usr/bin/chatgpt-webapp-desktop"
    install -Dm755 "${_srcdir}/chatgpt-webapp-desktop.bin" "$pkgdir/usr/bin/chatgpt-webapp-desktop.bin"
    install -Dm644 "${pkgname}.desktop" "$pkgdir/usr/share/applications/chatgpt-webapp-desktop.desktop"

    # Multiple icon sizes for all DEs/panels
    for size in 48 64 128 256; do
        install -Dm644 "${_srcdir}/${size}x${size}/chatgpt-webapp-desktop.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/chatgpt-webapp-desktop.png"
    done
}
