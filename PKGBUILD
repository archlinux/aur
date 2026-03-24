# Maintainer: Da Chen <dachen@connect.hku.hk>
pkgname=wayper
pkgver=0.2.0
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
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/yuukidach/wayper/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('98f60ba402dc3185991e207fd29e9629da98a7ead81744871f11b3baeb44e722')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
