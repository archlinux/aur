# Maintainer: David Runge <eolianoe At GoogleMAIL DoT com>

_name=etesync
pkgname=python-etesync
pkgver=0.5.1
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
source=("https://pypi.io/packages/source/e/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('927cbabe95249659a4e92e3a85d45be393a96a9656aefbcbebf92c75d50a6e3f5ffc0f4c92671c6b331aa66b9138a48a90d13183f7b070589cf83ef191a544ef')

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  pytest tests/{test_collections.py,test_crypto.py}
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

