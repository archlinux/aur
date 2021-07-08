# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
# Contributor: Jack Rubacha <rubacha.jack03@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Clemmitt M. Sigler <cmsigler dot online at gmail dot com>
# Contributor: xantares

pkgname=python-pyautogui
_name=PyAutoGUI
pkgver=0.9.53
pkgrel=1
pkgdesc="A cross-platform GUI automation Python module for human beings"
arch=('any')
url="https://github.com/asweigart/pyautogui"
license=('BSD')
depends=('python-xlib' 'python-pymsgbox' 'python-pytweening' 'python-pyscreeze' 'python-mouseinfo')
optdepends=('tk: windowing tool kit' 'scrot: screenshot tool')
# 'python-pygetwindow' - Not compatible with Linux yet
# 'python-pillow' - is provided by mouseinfo
makedepends=('python' 'python-setuptools')
provides=('python-pyautogui')
conflicts=('python-pyautogui-git')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('4aa1463cb4c1ff91f6bc91d3977e426ca531bd575aee0137914f691008729043803b874db9b4ea51463f996ae44f307bbd2e048a50bc976d458405d0ee244def')

build() {
	cd "$srcdir/$_name-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
