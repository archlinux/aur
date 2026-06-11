# Maintainer: so1omon
pkgname=plex-tui
pkgver=0.2.1
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
checkdepends=("python-pytest")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("f1b84354e5a0f7885fb7391d81f6d15ddece55822c8a5d5d08d01b4fadffbbeb")

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  PYTHONPATH=src python -m plextui.smoke
  PYTHONPATH=src python -m pytest
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
