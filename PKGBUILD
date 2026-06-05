# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=numpy-typing-compat
pkgname=python-${_base}
pkgdesc="Static typing compatibility layer for older versions of NumPy"
pkgver=20260602.2.5
pkgrel=1
arch=(any)
url="https://github.com/jorenham/${_base}"
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-numpy python-uv-build python-jinja python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base//-/_}-${pkgver}.tar.gz)
sha512sums=('52e9ca85da0bf3293418ddd04b7812363b9fbf5b3530f4fec2a78c0eea88ea25637c84409a7effd2cac91feac7d5d48507b82da6ad921e6c73879e53a4dc6602')

build() {
  cd ${_base//-/_}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base//-/_}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
