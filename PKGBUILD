# Maintainer: Da Chen <dachen@connect.hku.hk>
pkgname=wayper
pkgver=0.3.0
pkgrel=1
pkgdesc="Wayland-first wallpaper manager with Wallhaven integration and MCP server"
arch=('any')
url="https://github.com/yuukidach/wayper"
license=('MIT')
depends=('python' 'python-click' 'python-httpx' 'python-pillow' 'swww')
makedepends=('python-build' 'python-installer' 'python-hatchling')
optdepends=(
    'hyprland: focused monitor detection'
    'python-mcp: MCP server for AI assistant integration (pip install mcp)'
    'python-gobject: GTK4 wallpaper browser (wayper browse)'
    'gtk4: GTK4 wallpaper browser (wayper browse)'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/yuukidach/wayper/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7afc795ba7ee5434579b4c0ee65029f03d6cdc5231ecefc805935dfbec7f2e43')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
