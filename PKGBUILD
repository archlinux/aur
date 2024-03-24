# Maintainer: tac <tomacastro@itba.edu.ar>

_pkgname=magpylib
pkgname=python-magpylib
pkgver=5.0.0
pkgrel=31
pkgdesc="Biblioteca para simulaciones con fuentes de campos magnéticos"
arch=('any')
url='https://github.com/magpylib/magpylib'
license=('BSD 2-Clause')
depends=(python python-numpy python-scipy python-matplotlib python-plotly python-pyvista python-ipywidgets fmt glew)
makedepends=(python-setuptools)
checkdepends=(python)
source=("$url/archive/refs/tags/5.0.0.tar.gz")
sha256sums=('6ffb6284070e7ab0c7404430f0f061432148b29df1120ecfbd7475f285bcf576')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  python -m unittest
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer dist/*.whl --destdir="$pkgdir" --compile-bytecode=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
