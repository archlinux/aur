# Maintainer: Thomas Arnhold <thomas at arnhold dot org>
pkgname=python-yahooquery
_name=${pkgname#python-}
pkgver=2.3.3
pkgrel=1
pkgdesc="Python wrapper for an unofficial Yahoo Finance API "
arch=('any')
url="https://github.com/dpguthrie/yahooquery/"
license=('MIT')
depends=('python' 'python-lxml' 'python-pandas' 'python-requests-futures' 'python-tqdm')
optdepends=('python-selenium')
makedepends=('python-build' 'python-flit' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3c06c267b50e71f3e9ac402491adcd76e8c1489d31e66ceb0c905af8cc0a6fe9')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

