# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Greyson Christoforo <grey@christoforo.net>
# Contributor: Alex Forencich <alex@alexforencich.com>

pkgname=python-pyvisa
pkgver=1.14.1
pkgrel=1
pkgdesc="A Python package with bindings to the 'Virtual Instrument Software Architecture' VISA library"
url="https://github.com/pyvisa/pyvisa"
arch=('any')
license=('MIT')
depends=('python-distribute' 'python-docutils' 'python-typing_extensions')
makedepends=('git' 'python-setuptools-scm' 'python-pytest')
optdepends=('python-pyvisa-py: Pure Python backend')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
}

build() {
  cd pyvisa
  python setup.py build
}

check(){
  cd pyvisa
  PYTHONPATH="$srcdir/pyvisa-$pkgver" python -m pytest --pyargs pyvisa --ignore pyvisa/testsuite/test_cmd_line_tools.py
}

package(){
  cd pyvisa
  python setup.py install --skip-build --optimize=1 --root="$pkgdir"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
