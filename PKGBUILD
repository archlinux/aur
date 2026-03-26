# Maintainer: Da Chen <dachen@connect.hku.hk>
pkgname=wayper
pkgver=0.7.3
pkgrel=1
pkgdesc="Wayland-first wallpaper manager with Wallhaven integration and MCP server"
arch=('any')
url="https://github.com/yuukidach/wayper"
license=('MIT')
depends=('python' 'python-click' 'python-httpx' 'python-pillow' 'awww')
makedepends=('python-build' 'python-installer' 'python-hatchling')
optdepends=(
    'hyprland: focused monitor detection'
    'python-mcp: MCP server for AI assistant integration'
    'python-gobject: GTK4 GUI app (wayper-gui)'
    'gtk4: GTK4 GUI app (wayper-gui)'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/yuukidach/wayper/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('37a2d98ba615a5a291f42b34008156bc3acc460b353300a94693739ce9efd518')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Desktop entry for GUI
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/wayper.desktop" <<EOF
[Desktop Entry]
Name=Wayper
Exec=wayper-gui
Icon=preferences-desktop-wallpaper
Type=Application
Categories=Utility;
Comment=Wallpaper manager with Wallhaven integration
EOF
}
