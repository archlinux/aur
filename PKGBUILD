# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=mavproxy-git
pkgver=r2659.241cf6e3
pkgrel=1
pkgdesc='MAVLink proxy and command line ground station.'
arch=('any')
url='http://ardupilot.github.io/MAVProxy/html/index.html'
license=('GPL3')
depends=(python python-pymavlink)
makedepends=(git python python-build python-installer python-wheel
             python-setuptools)
provides=(mavproxy)
conflicts=(mavproxy)
source=('git+https://github.com/ArduPilot/MAVProxy.git')
sha256sums=('SKIP')

_pkgname='MAVProxy'

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
