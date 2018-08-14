# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkgname=async_generator
pkgname=python-${_pkgname}
pkgver=1.10
pkgrel=1
pkgdesc='Making it easy to write async iterators'
url='https://github.com/python-trio/async_generator'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/python-trio/async_generator/archive/v${pkgver}.tar.gz)
sha256sums=('7b61d78c5bb14fb89e5d67b58755033f234bb411e71924820d5a23e087de4535')
sha512sums=('bf5db7a6c8e5ff96685675f1015b33fd855d459675e2d457818b70a63c4d1866b9c4bde3d5401952cce07db875c1ea6484e36590683efb67080fb3a564b7757d')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

check() {
  cd ${_pkgname}-${pkgver}
  py.test
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" -O1 --skip-build
  install -Dm 644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
