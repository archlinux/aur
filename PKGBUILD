# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-uuid6
_name=${pkgname#python-}
pkgver=2024.07.10
pkgrel=1
pkgdesc="New time-based UUID formats which are suited for use as a database key"
arch=('any')
url="https://github.com/oittaa/uuid6-python"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fa0cad1568df3a0c04c09ea3a65a01783c1e46e073c681b585ec31e6a250925f')

build() {
  cd "$_name-python-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-python-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
