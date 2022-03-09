# Contributor: mawcomw <mawcomw@gmail.com>
_base=sievelib
pkgname=python-${_base}
pkgdesc="Client-side Sieve and Managesieve library written in Python"
pkgver=1.2.1
pkgrel=1
arch=(any)
url="https://github.com/tonioo/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-setuptools-scm git)
source=("git+${url}.git?#tag=${pkgver}")
sha512sums=('SKIP')

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
