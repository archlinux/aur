# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Greyson Christoforo <grey@christoforo.net>
# Contributor: Alex Forencich <alex@alexforencich.com>

pkgname=python-pyvisa
pkgver=1.15.0
pkgrel=4
pkgdesc="A Python package with bindings to the 'Virtual Instrument Software Architecture' VISA library"
url="https://github.com/pyvisa/pyvisa"
license=('MIT')
arch=('any')
depends=('python-distribute' 'python-docutils' 'python-typing_extensions')
optdepends=('python-pyvisa-py: Pure Python backend')
makedepends=('python-build' 'python-installer' 'python-pytest' 'python-setuptools-scm')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3da0bab73f06e1aba64a9f35b1aaee4cee1d950347b811844bb6322c5c849b52')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  cd pyvisa-$pkgver
  python -m build --wheel --no-isolation
}

check(){
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  cd pyvisa-$pkgver
  PYTHONPATH="$srcdir/pyvisa" python -m pytest --pyargs pyvisa --ignore pyvisa/testsuite/test_cmd_line_tools.py
}

package(){
  cd pyvisa-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
