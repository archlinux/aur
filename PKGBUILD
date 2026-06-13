# Maintainer: so1omon
pkgname=plex-tui
pkgver=0.3.14
pkgrel=1
pkgdesc="Standalone Plex terminal UI with mpv playback"
arch=("any")
url="https://github.com/so1omon563/plex-tui"
license=("MIT")
depends=(
  "mpv"
  "python"
  "python-pillow"
  "python-platformdirs"
  "python-plexapi"
  "python-rich"
  "python-textual"
)
makedepends=(
  "python-build"
  "python-hatchling"
  "python-installer"
  "python-wheel"
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("788f8502e45a1bbecd8356d076e3523273325143e16cc79736f7445347321fed")

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  PYTHONPATH=src python -m plextui.smoke
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
