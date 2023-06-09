# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=deepl
pkgname=python-${_base}
pkgver=1.15.0
pkgrel=1
pkgdesc="DeepL language translation API"
arch=(any)
url="https://github.com/${_base}com/${_base}-python"
license=(MIT)
depends=(python-requests)
makedepends=(python-build python-installer python-poetry-core python-wheel)
optdepends=('python-keyring: for support storing API Key')
install=${_base}.install
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('SKIP')
# validpgpkeys=('DBDC63E97C526204335805941FA7A782EC90634E') # Daniel Jones

build() {
  cd ${_base}-python-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# tests require a DeepL API key (paid account)

package() {
  cd ${_base}-python-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
