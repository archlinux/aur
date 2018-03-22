# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkgname=async_generator
pkgname=python-${_pkgname}
pkgver=1.8
pkgrel=1
pkgdesc='Making it easy to write async iterators'
url='https://github.com/python-trio/async_generator'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/python-trio/async_generator/archive/v${pkgver}.tar.gz)
sha256sums=('4e5558912b5a7d142d4740a54f2e731e6492a5859e5cfcc166190c612de77874')
sha512sums=('60a606616bd2865399b9bc33129b713af95b23964fead752bc892549507c9eae0ead8082ef235bb3886a539699dd5082bbd1a67f1c313f1e01a49c171cd91645')

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
