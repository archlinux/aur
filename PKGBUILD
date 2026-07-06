# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Greyson Christoforo <grey@christoforo.net>
# Contributor: Alex Forencich <alex@alexforencich.com>

pkgname=python-pyvisa
pkgver=1.16.2
pkgrel=1
pkgdesc="A Python package with bindings to the 'Virtual Instrument Software Architecture' VISA library"
url="https://github.com/pyvisa/pyvisa"
license=('MIT')
arch=('any')
depends=('python-legacy-cgi' 'python-typing_extensions' 'python-numpy' 'python-pytest')
optdepends=('python-pyvisa-py: Pure Python backend')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3e12abe3c7fdd9d26f81a5bc1cb489be2dfd8cf3f767008566b7fea555de4696')

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
