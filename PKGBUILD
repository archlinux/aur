# Maintainer: a821
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-xyzservices
_name=xyzservices
pkgver=2023.2.0
pkgrel=2
pkgdesc='Provides a repository of available XYZ services offering raster basemap tiles'
arch=('x86_64')
url="https://github.com/geopandas/xyzservices"
license=('BSD')
depends=('python')
makedepends=(
  'python-setuptools'
  'python-wheel'
  'python-build'
  'python-installer'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('3f9e2a97b9bccad6be9ec723a2a035da68078b745ef1fe0a1630961ec82975bcd60be0803414340b78f4e4080dbd232d2b162c7f202fb3a620d27272b0228812')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python-$_name/LICENSE"
}
