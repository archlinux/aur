# Maintainer: Thomas Arnhold <thomas at arnhold dot org>
pkgname=python-yahooquery
_name=${pkgname#python-}
pkgver=2.3.7
pkgrel=2
pkgdesc="Python wrapper for an unofficial Yahoo Finance API "
arch=('any')
url="https://github.com/dpguthrie/yahooquery/"
license=('MIT')
depends=('python' 'python-lxml' 'python-pandas' 'python-requests' 'python-requests-futures' 'python-tqdm')
optdepends=('python-selenium')
makedepends=('python-build' 'python-flit' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('be64712a70fd5fa602f1271ca3c46e550e87f7c5c9c513ea0010c65810bee857')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

