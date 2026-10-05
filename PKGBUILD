# Maintainer: qubeck <qubeck [AT] disroot [DOT] org>
# Contributor: 0fflineuser <0fflineuser [AT] cock [DOT] li>

pkgname=python-pdftext
_name=${pkgname#python-}
pkgver=0.7.1
pkgrel=1
pkgdesc='Extract structured text from PDFs quickly'
arch=('any')
url='https://github.com/datalab-to/pdftext'
license=('Apache-2.0')
depends=(
  'python>=3.10'
  'python-click>=8.1.8'
  'python-numpy>=1.24'
  'python-pydantic>=2.7.1'
  'python-pydantic-settings>=2.2.1'
  'python-pypdfium2>=5.10.1')
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('7484add28d48d8c04aab0076769f2d626454233de95de00c7b348cb6398045bd')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE \
    -t "$pkgdir/usr/share/licenses/${pkgname}"
}
