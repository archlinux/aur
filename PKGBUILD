# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: kureta <kureta@gmail.com>
# Contributor: Renato Candido <renatocan@gmail.com>
_base=lesscpy
pkgname=python-${_base}
pkgver=0.15.0
pkgrel=1
pkgdesc="Python LESS compiler"
url="https://github.com/${_base}/${_base}"
depends=(python-ply python-six)
makedepends=(python-setuptools)
checkdepends=(python-nose)
license=(MIT)
arch=(any)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('564373fbe2fe8878bc3f47f17bd9cbd3cc601b3f6b6e3a9d0142f9b9a253a4e75665b3688499315e7af8adb4618e842d31869bef660bc1cc048601bd803813d9')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  nosetests test
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
