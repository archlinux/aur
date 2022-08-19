# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=ffcx
pkgname=python-fenics-${_base}
pkgdesc="The FEniCSx Form Compiler"
pkgver=0.5.0
pkgrel=1
arch=(x86_64)
url="https://github.com/FEniCS/${_base}"
license=(MIT)
depends=(python-setuptools python-fenics-ufl python-fenics-basix python-cffi)
makedepends=(python-wheel)
optdepends=('python-pygraphviz: utility to draw graph')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('6c87c64a16880bd7b327bfae147ce46a5bc22c2c9fed055b8ac240becd7a34c4037557c4f6142a8edbb4c49738a4b6ea497d4324c8d4f1bd7c1d342363f06579')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
