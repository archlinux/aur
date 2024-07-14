# Maintainer:
# Contributor: François Magimel <magimel.francois at gmail dot com>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: rayte <rabyte__gmail>
# Contributor: aldeano <aldea.diaguita at gmail.com>

pkgname=python-cerealizer
pkgver=0.8.4
pkgrel=1
pkgdesc="A secure pickle-like module"
arch=('any')
url="http://www.lesfleursdunormal.fr/static/informatique/cerealizer/index_en.html"
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
license=('PSF-2.0')
source=(https://pypi.python.org/packages/source/C/Cerealizer/Cerealizer-${pkgver}.tar.gz)
sha256sums=('8ad33be5038f0987646be093d387e9976937cf2f1016884a05f9fa7cac1fb52e')

prepare() {
  # fix deprecated dash-separated options
  cd "Cerealizer-$pkgver"
  sed -i -r 's/^([a-z]+)-/\1_/' setup.cfg
}

build() {
  cd "Cerealizer-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "Cerealizer-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
