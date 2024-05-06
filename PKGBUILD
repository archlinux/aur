# Maintainer: Dringsim <dringsim@qq.com>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: jerry73204 <jerry73204 at google gmail>

pkgname=python-geoplot
_name=geoplot
pkgver=0.5.1
pkgrel=2
pkgdesc='High-level geospatial data visualization library for Python'
url='https://github.com/ResidentMario/geoplot'
arch=('any')
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=(
  'python-matplotlib'
  'python-seaborn'
  'python-pandas'
  'python-geopandas'
  'python-cartopy'
  'python-mapclassify'
  'python-contextily'
)
optdepends=(
  'python-scipy'
)
source=(
  "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
)
sha256sums=('9614b2caa193a42de943afa2fea953d0997b9daf25ab2949be0681361a122790')

build() {
  cd "$_name-$pkgver" || exit
  python -m build --wheel --no-isolation
  # export PYTHONHASHSEED=0
  # python setup.py build
}

package() {
  cd "$_name-$pkgver" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
  # python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README"
}
