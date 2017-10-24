# Maintainer: David Runge <dave@sleepmap.de>

pkgname=python-iwlib
pkgver=1.5
pkgrel=3
pkgdesc='Python module to interface with iwlib'
arch=('i686' 'x86_64')
url='https://github.com/nathan-hoad/python-iwlib'
license=('GPL2')
depends=('python' 'iw')
makedepends=('python-setuptools')
source=("${pkgname}::https://github.com/nathan-hoad/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('2b79e412949a465d1383620745b6bfbf5924ef8ed47d459882afc5c86e54d10d1b963055df7076a481fb7bd6ade1d318ce35ed36ee5c129c048bbf6b1790f432')

check() {
  cd "${pkgname}-${pkgver}"
  python setup.py test
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --skip-build --optimize=1 --prefix=/usr \
  --root="${pkgdir}/"

  install -Dm0644 AUTHORS "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm0644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
