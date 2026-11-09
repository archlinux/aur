# Maintainer: Ilyas Khallouki <khalloukielias@gmail.com>
pkgname=hypruse
pkgver=0.14.0
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
sha256sums=('ea53263a4f9a6863ec44c1d38e82391dd775c384b061e215cc57d2423080f61c')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  # the MCP server has to start against the python-mcp this system has
  PYTHONPATH=src python -c 'from hypruse.server import build_app; build_app()'
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
