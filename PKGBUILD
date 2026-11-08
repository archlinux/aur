# Maintainer: a821 at mail de

pkgname=python-pytest-skip-slow
_name=pytest-skip-slow
pkgver=1.1.0
pkgrel=1
pkgdesc="Pytest plugin to skip tests marked as slow by default"
arch=('any')
url="https://github.com/okken/pytest-skip-slow"
license=('MIT')
depends=('python-pytest')
makedepends=('python-build' 'python-flit-core' 'python-installer' 'python-build')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d390570d8995cdedf6bfab6add572ec35c72975604e8a6e8ea071fe7084d6f42')

prepare() {
  cd "$_name-$pkgver"
  sed -i 's/,<4//' pyproject.toml
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
