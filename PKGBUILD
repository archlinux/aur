# Maintainer: a821
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-xyzservices
_name=xyzservices
pkgver=2022.9.0
pkgrel=1
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
b2sums=('8d574bcd89cc06d227ca148daad2266c72102e73a9fe2e27569d2ba0c0e3fdd5d578597d429b890ac059293fee542dc67b49876d8d7d3822b064d5a02421d7f0')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python-$_name/LICENSE"
}
