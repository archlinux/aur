# Maintainer: qubeck <qubeck [AT] disroot [DOT] org>
# Contributor: 0fflineuser <0fflineuser [AT] cock [DOT] li>

pkgname=python-pdftext
_name=${pkgname#python-}
pkgver=0.7.1
pkgrel=2
pkgdesc='Extract structured text from PDFs quickly'
arch=(any)
url='https://github.com/datalab-to/pdftext'
license=(Apache-2.0)
depends=(
  'python'
  'python-click>=8.1.8'
  'python-numpy>=1.24'
  'python-pydantic>=2.7.1'
  'python-pydantic-settings>=2.2.1'
  'python-pypdfium2>=5.10.1'
)
makedepends=(
  python-build
  python-installer
  python-poetry-core
)
checkdepends=(
  python-pymupdf
  python-pytest
)
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c2d657ae0ca18ae2fa9509ecc5dd8fa4d5ddb0a7c6ee2d02dd724028647a56ee')

build() {
  cd "${_name}-${pkgver}"

  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}-${pkgver}"

  pytest tests
}

package() {
  cd "${_name}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
}
