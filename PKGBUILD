pkgname=philips-hue-for-arch
pkgver=0.1.1
pkgrel=1
pkgdesc="Desktop GUI for controlling Philips Hue lights on Linux"
arch=("any")
url="https://github.com/MechNoxer/philips-hue-for-arch"
license=("MIT")
depends=(
  "python"
  "pyside6"
  "python-requests"
)
makedepends=(
  "python-build"
  "python-installer"
  "python-setuptools"
  "python-wheel"
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/MechNoxer/philips-hue-for-arch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("SKIP")

_srcdir_name="philips-hue-for-arch-$pkgver"

build() {
  cd "$srcdir/$_srcdir_name"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_srcdir_name"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 philips-hue-for-arch.desktop \
    "$pkgdir/usr/share/applications/philips-hue-for-arch.desktop"
}
