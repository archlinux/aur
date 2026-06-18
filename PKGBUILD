# Maintainer: so1omon
pkgname=plex-tui
pkgver=0.4.2
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
sha256sums=("0d7832319a5468a89ed4eeb2dd0bad543663922f215765f40490d9e67723dac7")

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
