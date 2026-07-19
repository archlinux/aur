# Maintainer: Ilyas Khallouki <khalloukielias@gmail.com>
pkgname=hypruse
pkgver=0.9.0
pkgrel=1
pkgdesc="Computer use for Hyprland: semantic desktop state over IPC plus vision and native Wayland input, in one MCP server"
arch=('any')
url="https://github.com/IlyasKhallouki/hypruse"
license=('MIT')
depends=('python' 'python-mcp' 'hyprland' 'grim' 'wtype')
optdepends=('wl-clipboard: opt-in clipboard tool (HYPRUSE_CLIPBOARD=1)'
            'imagemagick: numbered Set-of-Marks captures (marks tool)')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f2e552e4998bca42f5a81d31e0aad648cd1e1b02f84d682e4eecc1d1b3087e21')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
