# Maintainer: gonwe <gonwex@gmail.com>
pkgname=doubao-desktop-bin
pkgver=1.0.0
pkgrel=2
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
sha256sums=('d75c0e09d71175f47de16d735967db7ffbf2ec310bf96b4795a72d56ba250f8f'
            'SKIP')

package() {
    cd "$srcdir"

    # Tauri binary
    install -Dm755 "doubao-desktop-${pkgver}-x86_64/doubao-desktop" \
        "$pkgdir/usr/bin/doubao-desktop"

    # Desktop entry
    install -Dm644 "${pkgname}.desktop" \
        "$pkgdir/usr/share/applications/doubao-desktop.desktop"

    # SVG icon
    install -Dm644 /dev/stdin "$pkgdir/usr/share/icons/hicolor/scalable/apps/doubao-desktop.svg" << 'SVG'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64">
  <rect width="64" height="64" rx="14" fill="#4F46E5"/>
  <text x="32" y="46" text-anchor="middle" font-size="36" font-family="sans-serif"
        fill="white" font-weight="bold">豆</text>
</svg>
SVG
}
