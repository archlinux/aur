# Maintainer: Rafael Silva <perigoso@riseup.net>

pkgname=tallyd
pkgver=0.1.0
pkgrel=1
pkgdesc="Detect ongoing calls by watching microphone and camera capture"
arch=('any')
url="https://github.com/perigoso/tallyd"
license=('MIT')
depends=('python')
optdepends=('pipewire: microphone detection support')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5e1129a2cf437e4a3cd96f3be6fd81866c5ece5a954ef146b855c3457fef9f78')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  PYTHONPATH=src python tests/test_tallyd.py
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 data/tallyd.conf.example \
    "$pkgdir/usr/share/tallyd/tallyd.conf.example"
}
