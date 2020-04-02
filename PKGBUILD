# Maintainer: David Runge <dvzrv@archlinux.org>

_name=etesync
pkgname=python-etesync
pkgver=0.11.1
pkgrel=2
pkgdesc="Python API to interact with an EteSync server"
arch=('any')
url="https://github.com/etesync/pyetesync"
license=('LGPL3')
depends=('python-appdirs' 'python-asn1crypto' 'python-cffi'
'python-cryptography' 'python-dateutil' 'python-furl' 'python-idna'
'python-orderedmultidict' 'python-packaging' 'python-peewee' 'python-py'
'python-pyasn1' 'python-pycparser' 'python-pyparsing' 'python-pytz'
'python-requests' 'python-six' 'python-vobject')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-coverage')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('f3850b98451dcc8844ec5aadfac45542d9269041e66eb549e3b33531869da35315013c95128478f5dde07b8a86d0f2d5939489f70e81bf700f46805e5405e390')

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  # soon tests can be run without specifying test files:
  # https://github.com/etesync/pyetesync/issues/19
  pytest -v tests/{test_collections.py,test_crypto.py}
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm 644 README.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
