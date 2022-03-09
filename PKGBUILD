# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Ashley Whetter <(firstname) @ awhetter.co.uk>
_base=seqlearn
pkgname=python-${_base}-git
pkgver=r89.32d4bfa
pkgrel=1
pkgdesc="A sequence classification toolkit for Python"
arch=(any)
url="https://github.com/larsmans/${_base}"
license=('custom')
depends=(python-scipy)
makedepends=(cython python-setuptools git)
source=(git+${url}.git)
sha512sums=('SKIP')

pkgver() {
  cd ${_base}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_base}
  export PYTHONHASHSEED=0
  python setup.py build_ext --inplace
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
