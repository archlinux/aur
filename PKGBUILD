# Maintainer: eslachance <eslachance@users.noreply.github.com>
pkgname=winmiddle
pkgver=0.1.0
pkgrel=1
pkgdesc="Windows-faithful middle-click autoscroll for Linux (Plasma/Wayland)"
arch=('any')
url="https://github.com/eslachance/winscroll"
license=('MIT')
depends=(
  'python'
  'python-evdev'
  'python-pyqt6'
  'layer-shell-qt'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
)
optdepends=(
  'kwin: focus/cursor helper script (recommended on Plasma)'
  'python-gobject: AT-SPI scrollable-under-cursor probing'
  'at-spi2-core: accessibility bus for scroll probing'
)
install=winmiddle.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1d54f6b2c99ca56309e14640f5d6f220754e276e0eb295e1ffdd02402faf052d')

build() {
  cd "$srcdir/winscroll-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/winscroll-$pkgver"
  python -m installer --destdir="$pkgdir" --prefix=/usr dist/*.whl
  bash packaging/install-data.sh "$pkgdir"
}