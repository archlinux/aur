# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=ufl
pkgname=python-fenics-${_base}
pkgdesc="UFL - Unified Form Language"
pkgver=2022.1.0.post0
pkgrel=1
arch=(any)
url="https://github.com/FEniCS/${_base}"
license=(MIT)
depends=(python-numpy python-setuptools)
makedepends=(python-wheel)
source=(${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('261c5634fefcdcddd956359e59d5474cf67fe9b3b63cd7740b41b022bee74a564ea637ea288360d46017271b391741d42a74479bd8978cb235627d7a3a7aee00')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
