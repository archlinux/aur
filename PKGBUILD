# Maintainer: Maxime Poulin <code@max-p.me>

pkgname=python-hid-parser-git
pkgver=0.0.3.r25.g4b7944f
pkgrel=2
pkgdesc="Typed pure Python library to parse HID report descriptors"
url="https://github.com/usb-tools/python-hid-parser"
license=('MIT')
arch=('any')
provides=("python-hid-parser")
conflicts=("python-hid-parser")
makedepends=(
  'python-setuptools'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-pytest'
  'python-hypothesis'
)
source=(
  "${pkgname}::git+https://github.com/usb-tools/python-hid-parser.git"
  "fix-tests.patch"
)
sha512sums=('SKIP' 'SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
  git apply ../fix-tests.patch
}

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

check() {
  cd "${pkgname}"
  python -m pytest
}
