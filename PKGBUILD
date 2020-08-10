# Maintainer: David Runge <dvzrv@archlinux.org>

_name=etesync
pkgname=python-etesync
pkgver=0.12.0
pkgrel=1
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
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('5d965a663fefeb841d43289e559f95dd9386665be47e00bfc84948ca3248b9bb7a57f253bdf4a2796c457ea0eb72e03e2f25a58eb7d7007d6bc691f9d5951226')
b2sums=('d740338b934a70370169a5e9974c2840a16c999b9a5652dbc9cb284ff241e7c3dc0ecf8836ae00e3b4544e29099034d498d466f4504c1e3c5f9356ac0b882e4b')

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  pytest -v
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
