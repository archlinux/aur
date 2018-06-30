# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkgname=async_generator
pkgname=python-${_pkgname}
pkgver=1.9
pkgrel=2
pkgdesc='Making it easy to write async iterators'
url='https://github.com/python-trio/async_generator'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/python-trio/async_generator/archive/v${pkgver}.tar.gz)
sha256sums=('942d0de4ad4e3b66d7cce4cbed29f7307111aad98599d4ebf01b9f3ebfd10be0')
sha512sums=('b68575be0edf6718298d79a4236d941b2821e0542d2f02378d4c70b7a8cbd558c75bcf1a29997d46c842cf37d9832d6f7e7234f0a894529dac3c6105e3dba2f1')

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
