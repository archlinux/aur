# Maintainer: mucahitzor <mucahitzor@users.noreply.github.com>
pkgname=ccbuddy
pkgver=0.1.0
pkgrel=1
pkgdesc="Pixel crab desktop pet for Wayland"
arch=('any')
url="https://github.com/mucahitzor/ccbuddy"
license=('MIT')
depends=(
  'python'
  'python-gobject'
  'python-cairo'
  'gtk3'
  'gtk-layer-shell'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
conflicts=('ccbuddy-git')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e2395f2d6945c4b00cdf1a53538f5d3e6a1013137a505aa67ce092d838f304bd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
