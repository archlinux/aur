# Maintainer: David Runge <dave@sleepmap.de>

_name=etesync
pkgname=python-etesync
pkgver=0.5.5
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
sha512sums=('1a05dfb644a97f732617a4f0c97acf7ef549f0f396fb52ea12d5946a5ab68019652f2d8cc86048bf9c46c6ba6ba0b5ced8d8071dff0d7f68d27b05a3f76c6858')

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

