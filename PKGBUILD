# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pyjtagtools
_name=${pkgname#python-}
pkgver=0.11.1
pkgrel=1
pkgdesc="JTAG tools for PyFtdi and QEMU"
arch=(any)
url="https://github.com/eblot/pyjtagtools"
license=(Apache-2.0)
depends=(
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-ruamel-yaml
)
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz")
# source=(https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl)
sha512sums=('cc8915fcc9ff9d795d01d63fb708f0ae7d033d58ed160ecd07e4576e7a96e49bfedaba67f0b6198e3ee916092d5a5a7f8f722a3730e6e9c068371870963629b5')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

# check() {
#   cd $_name-$pkgver
#
#   local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
#
#   # install to temporary location, as importlib is used
#   python -m installer --destdir=test_dir dist/*.whl
#   export PYTHONPATH="$_name-$pkgver/test_dir/$site_packages:$PYTHONPATH"
#   python $_name/tests/mockusb.py
#   export FTDI_VIRTUAL=on
#   python $_name/tests/gpio.py
#   python $_name/tests/eeprom_mock.py
# }

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  #   python -m installer --destdir="$pkgdir" ${srcdir}/${_name//-/_}-$pkgver-py3-none-any.whl
}
