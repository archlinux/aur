# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pyjtagtools
_name=${pkgname#python-}
pkgver=0.11.0
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
sha512sums=('95c158c859b154525b380fad9d54d3016b9673f6313b964931482d113655ce476e0f3456335b0132a2429188f8945b125cf6d56d7774c6f463e9d2117295957c')

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
