# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=testpath
pkgname=pypy3-${_base}
pkgdesc="A collection of utilities for Python code working with files and commands"
pkgver=0.6.0
pkgrel=1
arch=(any)
url="https://github.com/jupyter/${_base}"
license=(BSD-3-Clause)
depends=(pypy3)
makedepends=(pypy3-build pypy3-installer pypy3-flit-core)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('fe13523138c1e67f33a3aa707e81b8cc8b5a720ab231ea2c2407da003178d779a649f664213822022e26325fed4ddf468cf727737b94eb2ebf7315aacbce6857')

build() {
  cd ${_base}-${pkgver}
  pypy3 -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" pypy3 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
