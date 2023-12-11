# Maintainer: Thomas Arnhold <thomas at arnhold dot org>
pkgname=python-yahooquery
_name=${pkgname#python-}
pkgver=2.3.6
pkgrel=1
pkgdesc="Python wrapper for an unofficial Yahoo Finance API "
arch=('any')
url="https://github.com/dpguthrie/yahooquery/"
license=('MIT')
depends=('python' 'python-lxml' 'python-pandas' 'python-requests' 'python-requests-futures' 'python-tqdm')
optdepends=('python-selenium')
makedepends=('python-build' 'python-flit' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1f88575587de277e07b4534c1aff0d6ef702e3af0229a75239e8a9ac9283e037')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

