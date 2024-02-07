# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=deepl
pkgname=python-${_base}
pkgver=1.17.0
pkgrel=1
pkgdesc="Python library for the DeepL API"
arch=(any)
url="https://github.com/${_base}com/${_base}-python"
license=(MIT)
depends=(python-requests)
makedepends=(python-build python-installer python-poetry-core python-wheel git)
optdepends=('python-keyring: for support storing API Key')
install=${_base}.install
source=("git+${url}.git?signed#tag=v${pkgver}")
validpgpkeys=('D84A62C6CA4D3E3D6656083438FCACAAFD2C06B8') # Jan Ebbing <Jan.Ebbing@deepl.com>
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
