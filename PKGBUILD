# Maintainer: a821
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-xyzservices
_name=xyzservices
pkgver=2023.10.0
pkgrel=1
pkgdesc='Provides a repository of available XYZ services offering raster basemap tiles'
arch=('x86_64')
url="https://github.com/geopandas/xyzservices"
license=('BSD')
depends=('python')
makedepends=(
  'python-setuptools-scm'
  'python-wheel'
  'python-build'
  'python-installer'
)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_name-$pkgver.tar.gz")
b2sums=('a411738e3c3f1da651250e16621b110219c22677f94e1cc27e521dee5412f1b53485d3d004ed3f4e6c629400a27cf73c27a516ea991bdb8a5189b19b191b2b0d')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
