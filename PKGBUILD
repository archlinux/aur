# Maintainer: David Runge <dvzrv@archlinux.org>

_name=etesync
pkgname=python-etesync
pkgver=0.12.1
pkgrel=4
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
sha512sums=('dcc57b84b1fd8e9be5b1bfb677e395b10bc63466a418639403c3aa4b6e04e33cbff44f0d0a2601b009ce336eb47a6dcdc3dd34f11ef539c387575da1f9f1e3db')
b2sums=('60016c07320eea4db610d48f919454e8a41230a18a297430213c393bf1551f885e848effb34c79cdf646ec90bbddc08ffbbefa428973822558310f2321c475be')

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
