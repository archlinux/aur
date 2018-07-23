# Maintainer: David Runge <dave@sleepmap.de>

_name=etesync
pkgname=python-etesync
pkgver=0.5.2
pkgrel=2
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
source=("https://pypi.io/packages/source/e/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('3fd41cc422f4aad0fc40e06cb7fa25cbf61928343b4c8148d22a91f5cdd57d90efdce3c3522e7dc138cbe4db30197baa27524569a9736699070fe6882d8875f1')

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
    -vDm644 {DESCRIPTION.rst,README.md}
}

