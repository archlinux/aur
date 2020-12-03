# Maintainer: pumpkincheshire <sollyonzou@gmail.com>

pkgname='python-mercantile'
_name=mercantile
pkgver=1.1.6
pkgrel=4
pkgdesc='Spherical mercator tile and coordinate utilities'
arch=('any')
url='https://github.com/mapbox/mercantile'
license=('MIT')
makedepends=('python-setuptools')
depends=('python-click')
optdepends=('check-manifest: dev tools'
  'python-coveralls: test tools'
  'python-hypothesis: test tools'
  'python-pytest-cov: test tools'
  'python-pydocstyle: doc style control')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
  'https://raw.githubusercontent.com/mapbox/mercantile/master/LICENSE.txt')
sha256sums=('0dff4cbc2c92ceca0e0dfbb3dc74392a96d33cfa29afb1bdfcc80283d3ef4207'
  '30a7b88bfe78000da504b2d6dba9acac1925cf03a55439c1477602c75b46ca37')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
