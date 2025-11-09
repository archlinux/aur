# Maintainer: k4ditano <k4ditano@h2r.es>
pkgname=notnative-app-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Note-taking application with Vim-like keybindings, MCP server (40+ tools), AI chat, and smart tags (binary package)"
arch=('x86_64')
url="https://github.com/k4ditano/notnative-omarchy"
license=('MIT')
depends=('gtk4' 'webkitgtk-6.0' 'libadwaita' 'gtksourceview5' 'libpulse' 'sqlite' 'mpv' 'mujs' 'yt-dlp')
optdepends=(
    'openai-api-key: For AI chat functionality'
    'waybar: For system tray integration'
)
provides=('notnative-app')
conflicts=('notnative-app')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/notnative-app-bin-$pkgver-x86_64.tar.gz")
sha256sums=('7e298e015cdfaca326c8e1db032321fd4de5972e41e3dd5cffc87cdb219ebfe9')

package() {
    cd "$srcdir"

    # Instalar binario
    install -Dm755 "notnative-app" "$pkgdir/usr/bin/notnative-app"
    
    # Instalar script de control
    install -Dm755 "notnative-control.sh" "$pkgdir/usr/bin/notnative-control"
    
    # Instalar archivos de desktop
    install -Dm644 "notnative.desktop" "$pkgdir/usr/share/applications/notnative.desktop"
    
    # Instalar assets
    install -Dm644 "assets/style.css" "$pkgdir/usr/share/notnative-app/assets/style.css"
    install -Dm644 "assets/logo/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/notnative.svg"
    install -Dm644 "assets/logo/logo.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/notnative.png"
    install -Dm644 "assets/logo/logo.png" "$pkgdir/usr/share/pixmaps/notnative.png"
    
    # Instalar documentación
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
    install -Dm644 "docs/MCP_INTEGRATION.md" "$pkgdir/usr/share/doc/$pkgname/MCP_INTEGRATION.md" 2>/dev/null || true
    install -Dm644 "docs/BACKGROUND_CONTROL.md" "$pkgdir/usr/share/doc/$pkgname/BACKGROUND_CONTROL.md" 2>/dev/null || true
}
