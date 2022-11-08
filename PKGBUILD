# Maintainer: Maxime Poulin <code@max-p.me>

pkgname=python-hid-parser-git
pkgver=0.0.3.r25.g4b7944f
pkgrel=1
pkgdesc="Typed pure Python library to parse HID report descriptors"
url="https://github.com/usb-tools/python-hid-parser"
license=('MIT')
arch=('any')
provides=("python-hid-parser")
conflicts=("python-hid-parser")
makedepends=('python-setuptools' 'python-pytest' 'python-hypothesis')
source=("${pkgname}::git+https://github.com/usb-tools/python-hid-parser.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  python setup.py build
}

package() {
  cd "${pkgname}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

check() {
  cd "${pkgname}"
  python -m pytest
}
