# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

_base=wheezy.captcha
pkgname=python-${_base/./-}
pkgver=3.2.1
pkgrel=1
pkgdesc="Lightweight CAPTCHA library"
arch=(x86_64)
url="https://github.com/akornatskyy/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel cython)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('1041e28f60442157bba3f118f9633851ef0715af81b7d447951816173a1cb4ee933c3b3ff5ab8d93a0900768b0556539d68931b459241274fde25627017b9f32')

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
