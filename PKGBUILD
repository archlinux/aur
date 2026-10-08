# Maintainer: user14923929 <153951865+user14923929@users.noreply.github.com>
pkgname=qualcomm-splash-tools
pkgver=0.2.0
pkgrel=1
pkgdesc='Extract and repack Qualcomm SPLASH!! boot splash images'
arch=('any')
url='https://github.com/user14923929/qualcomm-splash-tools'
license=('GPL-3.0-only')
depends=('python' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3e85549d6410a657c8673c9ccce4be85695b58715a4093c49312fd39de6f21ef')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  python -m pytest -q
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
