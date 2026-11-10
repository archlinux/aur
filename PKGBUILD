# Maintainer: crl <crl18039102576@126.com>

pkgname=kwin-mcp
pkgver=0.12.0
pkgrel=1
pkgdesc="MCP server for Linux desktop GUI automation on KDE Plasma 6 Wayland"
arch=('any')
url="https://github.com/isac322/kwin-mcp"
license=('MIT')
depends=(
  'at-spi2-core'
  'dbus'
  'kwin'
  'libei'
  'python'
  'python-dbus'
  'python-gobject'
  'python-mcp'
  'python-pillow'
  'spectacle'
  'wayland'
)
makedepends=('python-build' 'python-installer' 'python-uv-build')
optdepends=(
  'wayland-utils: wayland_info tool'
  'wl-clipboard: clipboard_get and clipboard_set tools'
  'wtype: direct Unicode typing for keyboard_type_unicode'
  'ydotool: input fallback for live sessions when KWin EIS is unavailable'
)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fc09127e006c89ef6049e1db1ff18636b9c961e96a63dc9926c6f50fc2220278')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
