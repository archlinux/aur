# Maintainer: noideaman <packages@weebvr.com>
pkgname=python-tinyoscquery-git
_pkgname=tinyoscquery
pkgver=0.1.2.r2.ga2c0af4
pkgrel=2
pkgdesc="OSCQuery for Python"
arch=("any")
url="https://github.com/Hackebein/$_pkgname"
license=("MIT")
depends=("python" "python-zeroconf" "python-requests")
makedepends=("python-setuptools")
provides=("python-${_pkgname}")
conflicts=("python-${_pkgname}")
source=("git+https://github.com/Hackebein/${_pkgname}.git")
sha256sums=('SKIP')
pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1 || return 1
}

