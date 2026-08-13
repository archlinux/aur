# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot top>
# Contributor: Jack Rubacha <rubacha.jack03@gmail.com>
# Contributor: Clemmitt M. Sigler <cmsigler dot online at gmail dot com>
# Contributor: xantares
pkgname=python-pyautogui
_name=PyAutoGUI
pkgver=0.9.54
pkgrel=3
pkgdesc="A cross-platform GUI automation Python module for human beings"
arch=('any')
url="https://github.com/asweigart/pyautogui"
license=('BSD-3-Clause')
depends=(
  'python-mouseinfo'
  'python-pymsgbox'
  'python-pyscreeze'
  'python-pytweening'
  'python-xlib'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
#  'python-sphinx'  ## docs
  'python-wheel'
)
# checkdepends=(
#  'python-pytest'
#  'xorg-server-xvfb'
# )
optdepends=(
  'scrot: screenshot tool'
  'tk: windowing tool kit'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('dd1d29e8fd118941cb193f74df57e5c6ff8e9253b99c7b04f39cfc69f3ae04b2')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

# check() {
#   cd "$_name-$pkgver"
#   python -m venv --clear --without-pip --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   xvfb-run test-env/bin/python -I -m pytest
# }

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
