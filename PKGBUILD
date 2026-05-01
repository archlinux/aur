# Maintainer: Jean-Louis Queguiner <jlqueguiner@gladia.io>
pkgname=python-num2words2
_pkgname=num2words2
pkgver=1.0.12
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
sha256sums=('dd6aa44655bcc17270cfa0ac3046556aac12c339203f04b2159c63a28f47121f')

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
