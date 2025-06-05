# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=gmpy
pkgname=pypy3-${_base}2
pkgdesc="Interface to GMP, MPFR, and MPC"
pkgver=2.2.1
pkgrel=1
arch=(any)
url="https://github.com/aleaxit/${_base}"
license=(LGPL-3.0-or-later)
depends=(glibc gmp libmpc mpfr pypy3-packaging)
makedepends=(pypy3-build pypy3-installer pypy3-setuptools)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('88e506c20ca4a1fc67c8fb7a7258750316437e5d66a22845e09b87e76a1265746762156cfda9c1e2e47a2aa6771ea807282169a0af6a5b782a3b7c3117f77940')

build() {
  cd ${_base}-${pkgver}
  pypy3 -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" pypy3 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 COPYING* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
