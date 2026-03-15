pkgname=farmmod-hub
pkgver=0.1.3
pkgrel=1
pkgdesc="Mod manager for Farming Simulator on Linux"
arch=("any")
url="https://github.com/henriquejsza/farmmod-hub"
license=("AGPL-3.0-or-later")
depends=(
  "python"
  "python-gobject"
  "gtk4"
  "libadwaita"
)
makedepends=(
  "python-build"
  "python-installer"
  "python-wheel"
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("999a2d41c1f387bd74261184bf4c907e06bacf52029a984eb1642df917d0d5dd")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "AUTHORS" "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"

  install -Dm644 \
    "flatpak/io.github.henriquejsza.farmmod-hub.desktop" \
    "$pkgdir/usr/share/applications/io.github.henriquejsza.farmmod-hub.desktop"
  install -Dm644 \
    "flatpak/io.github.henriquejsza.farmmod-hub.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/io.github.henriquejsza.farmmod-hub.metainfo.xml"

  install -Dm644 \
    "data/logo/io.github.henriquejsza.farmmod-hub.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/io.github.henriquejsza.farmmod-hub.png"
  install -Dm644 \
    "data/logo/io.github.henriquejsza.farmmod-hub.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.henriquejsza.farmmod-hub.png"
  install -Dm644 \
    "data/logo/io.github.henriquejsza.farmmod-hub.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/io.github.henriquejsza.farmmod-hub.png"

  install -Dm644 \
    "data/style.css" \
    "$pkgdir/usr/share/farmmod-hub/data/style.css"
  install -Dm644 \
    "data/logo/io.github.henriquejsza.farmmod-hub.png" \
    "$pkgdir/usr/share/farmmod-hub/data/logo/io.github.henriquejsza.farmmod-hub.png"
}
