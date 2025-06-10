# Maintainer: hengtseChou <hankthedev@gmail.com>

pkgname=niriswitcher
pkgver=0.6.1
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1f86f0702cad94eb3f663ca8284468dc6b97ffa621055cb1d5fc038d0cf01487')

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
