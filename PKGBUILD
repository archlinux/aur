# Maintainer: so1omon
pkgname=plex-tui
pkgver=0.3.20
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
sha256sums=("2e550a37c89b958d6eb4744cbd847fa3bbc7b202dc15ed63d1f22c787767f9b9")

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
