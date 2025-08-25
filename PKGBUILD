# Maintainer: envolution
# Contributor: C.Grace <rubbermetal@yahoo.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-pptx
_pypiname=${pkgname}
pkgver=1.0.2
pkgrel=5
pkgdesc="A Python library for creating and updating PowerPoint (.pptx) files"
url="https://github.com/scanny/python-pptx"
arch=('any')
license=('MIT')
depends=(
  python
  python-pillow
  python-lxml
  python-typing_extensions
  python-xlsxwriter
)
checkdepends=(
  python-pyparsing
  python-pytest
)
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/scanny/python-pptx/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1eddfbb81fa264345a205f53714d0ee0c544bada7d7e866b8d531bc7d4a30989')

build() {
  cd "${_pypiname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pypiname}-${pkgver}"
  PYTHONPATH=src \
    python -m pytest
}

package() {
  cd "${_pypiname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
