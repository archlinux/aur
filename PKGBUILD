# Maintainer: Maxime Poulin <code@max-p.me>

pkgname=python-hid-parser-elitech-git
pkgver=0.0.3.r30.g0ae6665
pkgrel=2
pkgdesc="Typed pure Python library to parse HID report descriptors with modifaction for Elitech"
url="https://github.com/pasccom/python-hid-parser.git"
license=('MIT')
arch=('any')
provides=("python-hid-parser-elitech")
conflicts=("python-hid-parser-elitech")
makedepends=(
  'python-setuptools'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-pytest'
  'python-hypothesis'
)
source=(
  "${pkgname}::git+$url"
  "fix-tests.patch"
)
sha256sums=('SKIP'
            '0794f073353a23037e052b08b83e7ef9c69aa1374cb307d601d6b6977dd51dd1')

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

