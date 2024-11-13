# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pyftdi
pkgname=python-pyftdi
pkgver=0.55.4
pkgrel=3
pkgdesc="FTDI device driver written in pure Python"
arch=(any)
url="https://pypi.org/project/pyftdi"
license=(BSD-3-Clause)
depends=(
  python
  python-pyusb
  python-pyserial
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
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('516fa48fe8a12c901d16492be5090d48d4a31c0f249a37735b2cd6df311dbb73ceada711100852573a5c370f2d3094eebb59719f19e52752cb9604ac19ebb2d9')
b2sums=('355211cfd8a1b75804b363e5d265cbd67fb1a04fd28b4a8c1cbbd3b645c0f4faa4c0ccebbf2870ee9859111206eb6e986d588ee6b8fa010785c42003ec086eac')

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
  #   install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  #   install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
