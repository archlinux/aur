# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

_base=wheezy.captcha
pkgname=python-${_base/./-}
pkgver=3.2.0
pkgrel=1
pkgdesc="Lightweight CAPTCHA library"
arch=(x86_64)
url="https://github.com/akornatskyy/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel cython)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('145108336164f4c9e1aded5b254fa5f85a090ab317d87e24c39670dcc67e19405bc801eea5b4b9d7d4646df0db1c828c2be73c870c1f51ace66f7713d02ba099')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
