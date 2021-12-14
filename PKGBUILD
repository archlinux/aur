# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pykry
pkgname=python-${_base}
pkgdesc="Thin wrapper around KryPy (Krylov subspace package)"
pkgver=0.1.5
pkgrel=3
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(MIT)
depends=(python-krypy)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('ad615d19b4436431188b19fe0363e1e4305059a1790112b4307a2fd26192460fc1db9341680d7e835c3763d568bcd6ffe9ea84e64bf9d25ced80bbada7605e35')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_base}-${pkgver}"
  PYTHONPATH="$PWD/build/lib/${_base}/" python -m pytest -k 'not basic'
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
