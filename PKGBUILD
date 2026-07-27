# Maintainer: eslachance <eslachance@users.noreply.github.com>
pkgname=winmiddle
pkgver=0.2.0
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
sha256sums=('ed39e7b40e75d01a3847b99922bb15dc2ac11cdb61e9f39d6e95267fe2d681b0')

build() {
  cd "$srcdir/winscroll-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/winscroll-$pkgver"
  python -m installer --destdir="$pkgdir" --prefix=/usr dist/*.whl
  bash packaging/install-data.sh "$pkgdir"
}
