pkgname=lightdeck
pkgver=0.3.0
pkgrel=1
pkgdesc="Desktop remote for Hue lights: rooms, scenes and colors"
arch=("any")
url="https://github.com/MechNoxer/lightdeck"
license=("MIT")
depends=(
  "python"
  "pyside6"
  "python-requests"
  "python-zeroconf"
)
makedepends=(
  "python-build"
  "python-installer"
  "python-setuptools"
  "python-wheel"
)
provides=("philips-hue-for-arch")
conflicts=("philips-hue-for-arch")
replaces=("philips-hue-for-arch")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("643aaf5d27d08c1a1b124bee5badeda90045189a0650cd9e195dd341500afa3d")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  /usr/bin/python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 packaging/linux/lightdeck.desktop "$pkgdir/usr/share/applications/lightdeck.desktop"
  install -Dm644 src/lightdeck/assets/lightdeck.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/lightdeck.png"
}
