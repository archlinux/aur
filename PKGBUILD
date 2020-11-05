# Maintainer: pumpkincheshire <sollyonzou@gmail.com>

pkgname='python-mercantile'
_name=mercantile
pkgver=1.1.6
pkgrel=1
pkgdesc='Context geo-tiles in Python'
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
  'https://github.com/mapbox/mercantile/blob/master/LICENSE.txt')
sha256sums=('0dff4cbc2c92ceca0e0dfbb3dc74392a96d33cfa29afb1bdfcc80283d3ef4207'
  'd89ff39f64a9287c61787591d9771b8d9fe100a393f31e906d377c4ecf694ac6')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
