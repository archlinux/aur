# Maintainer: hengtseChou <hankthedev@gmail.com>

pkgname=niriswitcher
pkgver=0.5.2
pkgrel=2
pkgdesc="An application switcher for niri"
arch=('any')
url="https://github.com/isaksamsten/niriswitcher"
license=('MIT')
depends=(
  'niri'
  'python-gobject'
  'gtk4-layer-shell'
  'libadwaita'
)
makedepends=(
  'python-hatchling'
  'python-build'
  'python-installer'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f4cf75e729e13c79b4a9a30fab5958b973d75fec630c9d01e6415bc3ec5e46d5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
