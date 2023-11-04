# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=deepl
pkgname=python-${_base}
pkgver=1.16.0
pkgrel=1
pkgdesc="Python library for the DeepL API"
arch=(any)
url="https://github.com/${_base}com/${_base}-python"
license=(MIT)
depends=(python-requests python-packaging)
makedepends=(python-build python-installer python-poetry-core python-wheel git)
optdepends=('python-keyring: for support storing API Key')
install=${_base}.install
source=("git+${url}.git?signed#tag=v${pkgver}")
validpgpkeys=('DBDC63E97C526204335805941FA7A782EC90634E') # Daniel Jones (GitHub key - work laptop) <daniel.jones@deepl.com>
sha512sums=('SKIP')

build() {
  cd ${_base}-python
  python -m build --wheel --skip-dependency-check --no-isolation
}

# tests require a DeepL API key (paid account)

package() {
  cd ${_base}-python
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
