# Maintainer: hengtseChou <hankthedev@gmail.com>

pkgname=niriswitcher
pkgver=0.7.1
pkgrel=1
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('be6fb6413db8d250a7fe51b8fa892e6d44adc1fabc8199f1127c52967c4bc6bc')

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
