# Maintainer: Mohammad Brian Abdillah <mohammadbrianabdillah@gmail.com>

_name=searoute
pkgname=python-searoute
pkgver=1.6.0
pkgrel=1
pkgdesc='Python package for generating the shortest sea route between two points on Earth'
arch=(any)
url='https://github.com/genthalili/searoute-py'
license=(Apache-2.0)
depends=(
  python
  python-geojson
  python-networkx
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=(
  'python-igraph: faster graph backend (igraph algorithm)'
)
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a2f9827b0aa0f1216f4696aa9cd9d358e9950cba496e8445dc2a3d5691862697')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENCE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENCE.txt"
}
