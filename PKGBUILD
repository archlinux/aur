# Maintainer: a821
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-xyzservices
_name=xyzservices
pkgver=2023.5.0
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
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('0bec019dd881ff7c4ec47a866883bd9f1339499d4bedc98dc087e3b8fb4cf56d1827f137eadd074f23e206f66be48b0e402391ea85291cb55f81e3dee6f4e0de')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python-$_name/LICENSE"
}
