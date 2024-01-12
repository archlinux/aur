# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-uuid6
_name=${pkgname#python-}
pkgver=2024.01.12
pkgrel=1
pkgdesc="New time-based UUID formats which are suited for use as a database key"
arch=('any')
url="https://github.com/oittaa/uuid6-python"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$_name-$pkgver.tar.gz::https://github.com/oittaa/uuid6-python/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b6a1d5fe9ff13bda7097a9448fd08f9b8220874197db9494f6a76b36a8ba70ab')

build() {
  cd "$_name-python-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-python-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
