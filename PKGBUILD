pkgname=python-trianglesolver
_build_fragment="commit=bdd013471ad7d171f19f8ac81e1b9748a6a717c4"
pkgdesc="Find all the sides and angles of a triangle"
pkgver=1.2
pkgrel=1
arch=('any')
url="https://github.com/sbyrnes321/trianglesolver"
license=('MIT')
depends=(
python
)
makedepends=(
git
python-build
python-installer
python-setuptools
python-wheel
)
source=(
"git+https://github.com/sbyrnes321/trianglesolver.git#${_build_fragment}"
)
b2sums=('4e77ddadbc5961b7612e866dfac927664b321e360bdb693f50c6cf510864693ac01ffa456568ffdb4b81b9ff30806cd27ee56e656b9d86f48c3b508a64d357d6')

pkgver() {
  cd trianglesolver
  python setup.py --version 2> /dev/null
}

build() {
  cd trianglesolver
  python -m build --wheel --no-isolation
}

package() {
  cd trianglesolver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
