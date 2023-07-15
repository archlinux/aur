# Maintainer: a821
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-xyzservices
_name=xyzservices
pkgver=2023.7.0
pkgrel=2
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
b2sums=('1d758c9781c02744d580324fd34d3f7f7321645ffa39f7ef33a68606c30c9bf0fd1e9c59818417cb4cfdaea3f0b6f5bd110f3aac3b0c2fdb45a9626f062935b0')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
