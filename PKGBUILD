# Maintainer: gonwe <gonwex@gmail.com>
pkgname=doubao-desktop-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Doubao AI Assistant - web app wrapper (ByteDance)"
arch=('any')
url="https://www.doubao.com/chat/"
license=('custom')
depends=('xdg-utils')
optdepends=(
    'chromium: best app-mode experience'
    'google-chrome: app-mode support'
    'firefox: works but no app-mode'
)

source=("${pkgname}.sh"
        "${pkgname}.desktop")
sha256sums=('SKIP'
            'SKIP')

package() {
    cd "$srcdir"

    # Wrapper script — tries chromium app-mode first, falls back to xdg-open
    install -Dm755 "${pkgname}.sh" "$pkgdir/usr/bin/doubao-desktop"

    # Desktop entry
    install -Dm644 "${pkgname}.desktop" \
        "$pkgdir/usr/share/applications/doubao-desktop.desktop"

    # SVG icon (simple "豆" text icon)
    install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    cat > "$pkgdir/usr/share/icons/hicolor/scalable/apps/doubao-desktop.svg" << 'SVG'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64">
  <rect width="64" height="64" rx="14" fill="#4F46E5"/>
  <text x="32" y="46" text-anchor="middle" font-size="36" font-family="sans-serif"
        fill="white" font-weight="bold">豆</text>
</svg>
SVG
}
