# Maintainer: Shimi Chen <shimi dot chen at gmail dot com>
pkgname=python-yahooquery
_name=${pkgname#python-}
pkgver=2.4.1
pkgrel=1
pkgdesc="Python wrapper for an unofficial Yahoo Finance API "
arch=('any')
url="https://github.com/dpguthrie/yahooquery/"
license=('MIT')
depends=('python' 'python-lxml' 'python-pandas' 'python-requests' 'python-requests-futures' 'python-tqdm' 'python-curl-cffi' 'python-hatchling')
optdepends=('python-selenium')
makedepends=('python-build' 'python-flit' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e6093dac688d2d0d434a6f4c1c6bfdf6385fa47c5a3d08ef86a346119c6dabd7')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

