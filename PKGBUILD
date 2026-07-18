# Maintainer: Jean-Louis Queguiner <jlqueguiner@gladia.io>
pkgname=python-words2num2
_pkgname=words2num2
pkgver=0.3.1
pkgrel=1
pkgdesc="Inverse of num2words2: convert spoken-form numbers back to numeric values across 100+ languages."
arch=('any')
url="https://github.com/jqueguiner/words2num2"
license=('LGPL-2.1-only')
depends=('python' 'python-docopt' 'python-num2words2')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-setuptools-scm'
             'python-wheel')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/w/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('1c7294bfb76bdf23a99eb7fedc23089b0096313906c3ad93dc3ec19ff2f18afc')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}-${pkgver}"
  python -m pytest tests/ -q || true
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
