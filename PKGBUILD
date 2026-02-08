# Maintainer: Thiago <killown.matrix@gmail.com>
#
pkgname=pywayfire-git
_name=pywayfire
pkgver=3.2.r27.g4c8ed00
pkgrel=1
pkgdesc="Python bindings for Wayfire (Master Branch)"
arch=('any')
url="https://github.com/WayfireWM/pywayfire"
license=('MIT')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=("pywayfire-git")
conflicts=("python-wayfire")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_name}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "${_name}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
