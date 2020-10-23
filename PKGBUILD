# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Clemmitt M. Sigler <cmsigler dot online at gmail dot com>
# Contributor: xantares
pkgname=python-pyautogui-git
_fullpkgname=${pkgname%-git}
_pkgname=${_fullpkgname#python-}
pkgver=r361.a62027c
pkgrel=1
pkgdesc="A cross-platform GUI automation Python module for human beings (git)"
arch=('any')
url="https://github.com/asweigart/pyautogui"
license=('BSD')
depends=('python-xlib' 'python-pillow' 'python-pymsgbox' 'python-pyscreeze' 'python-pytweening')
          # 'python-pygetwindow' - Not compatible with Linux yet
makedepends=('python-setuptools' 'git')
provides=('python-pyautogui')
conflicts=('python-pyautogui')
source=("git+https://github.com/asweigart/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    ( set -o pipefail
      cd "$srcdir/${_pkgname}"
      git describe --long --tags 2>/dev/null |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" \
          "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
	cd "${srcdir}/${_pkgname}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
