# Maintainer: David Runge <dave@sleepmap.de>

_name=etesync
pkgname=python-etesync
pkgver=0.5.6
pkgrel=1
pkgdesc="Python API to interact with an EteSync server."
arch=('any')
url="https://pypi.python.org/pypi/etesync/"
license=('LGPL')
depends=('python-appdirs'
         'python-asn1crypto'
         'python-cffi'
         'python-coverage'
         'python-cryptography'
         'python-furl'
         'python-idna'
         'python-orderedmultidict'
         'python-packaging'
         'python-peewee'
         'python-py'
         'python-pyasn1'
         'python-pycparser'
         'python-pyparsing'
         'python-dateutil'
         'python-requests'
         'python-scrypt'
         'python-six'
         'python-vobject')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('7aa7e1e9e875dfa873b084185120e956a3c3f23de37c589285b3eeca6276003e77802c5b92ff200b17bde8780fad3ef22153cffcf2c36a75d0a58916b498b9fb')

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  # only run relevant tests:
  # https://github.com/etesync/pyetesync/issues/5
  pytest tests/{test_collections.py,test_crypto.py}
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -t "${pkgdir}/usr/share/doc/${pkgname}" \
    -vDm 644 {DESCRIPTION.rst,README.md}
}

