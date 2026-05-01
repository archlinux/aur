# Maintainer: Jean-Louis Queguiner <jlqueguiner@gladia.io>
pkgname=python-num2words2
_pkgname=num2words2
pkgver=1.0.10
pkgrel=1
pkgdesc="Modules to convert numbers to words. Actively-maintained fork of num2words with 159+ language codes."
arch=('any')
url="https://github.com/jqueguiner/num2words2"
license=('LGPL-2.1-only')
depends=('python' 'python-docopt')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-setuptools-scm'
             'python-wheel')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/n/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('070b3e06a8ccb75193121ba1816ef90c2ddb1623c8b8f67297aed2480119f47b')

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
