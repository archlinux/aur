# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

_base=wheezy.captcha
pkgname=python-${_base/./-}
pkgver=3.2.2
pkgrel=1
pkgdesc="Lightweight CAPTCHA library"
arch=(x86_64)
url="https://github.com/akornatskyy/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel cython)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('49b4d3a69baf6c0be06bcfa39d494fbb5f9fe174d59f9db9627ce2ff3021e436ca5e16ad0eedfda1536d9682fb386181b34f343bac908a02b5243ca4c94ae880')

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
