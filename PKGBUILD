pkgname=lightdeck
pkgver=0.3.1
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
sha256sums=("4619858e5a8d6cc6e70e91795955406e5fa0936df6f3228a400a253a4fa3d5d3")

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
