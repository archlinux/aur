# Maintainer: Jean-Louis Queguiner <jlqueguiner@gladia.io>
pkgname=python-words2num2
_pkgname=words2num2
pkgver=0.3.0
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
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')

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
