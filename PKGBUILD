# Maintainer: David Runge <eolianoe At GoogleMAIL DoT com>

_name=etesync
pkgname=python-etesync
pkgver=0.5.0
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
         'python-pyscrypt'
         'python-dateutil'
         'python-requests'
         'python-six'
         'python-vobject')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/e/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('a3766117314ed10b088ac7388d0685321a5789939e689a05d46337e339819103ab3d9b7f8a888c7bb3743fe2eacdd66e9e1dda4301fc6a6853a40c87e97e0eee')

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  python setup.py test
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm644 README.md "${pkgdir}/usr/share/doc/${pkgname}"
}

