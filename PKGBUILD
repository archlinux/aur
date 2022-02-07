# Contributor: Ivan Semkin (ivan at semkin dot ru)
_base=python-dbusmock
pkgname=${_base}-git
pkgver=0.25.0.r8.a51ad65
pkgrel=1
pkgdesc="Mock D-Bus objects"
arch=(any)
url="https://github.com/martinpitt/${_base}"
license=(LGPL3)
provides=("${_base}")
conflicts=("${_base}")
depends=(python-dbus python-gobject)
makedepends=(python-setuptools)
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd ${_base}
  echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

build() {
  cd ${_base}
  export PYTHONHASHSEED=0
  python setup.py build
}

check() {
  cd ${_base}
  python setup.py test
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
