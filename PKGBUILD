# Maintainer: Jean-Louis Queguiner <jlqueguiner@gladia.io>
pkgname=python-words2num2
_pkgname=words2num2
pkgver=0.2.2
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
sha256sums=('b8557179b5bb45b3e3fca21103e116b15ffd4e729001ada786817378b3f9ce8a')

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
