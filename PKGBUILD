# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Labello <sebastian.semper@tu-ilmenau.de>
_base=fastmat
pkgname=python-${_base}
pkgver=0.2.1
pkgrel=1
pkgdesc="fast linear transforms in Python"
arch=('x86_64')
url="https://pypi.org/project/${_base}"
license=(Apache2)
depends=(python-scipy)
makedepends=(cython python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('918a3d9cb3b49036877923fe0cd4c33928e777ab9c59653b78d5ed1a4522c04c33c64491eb3481597f7bf74bf9c7d000fe5b6e17740422ab0837d34256e84859')

build() {
  cd ${_base}-${pkgver}
  make compile
}

package() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
