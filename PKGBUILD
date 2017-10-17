# Maintainer: David Runge <dave@sleepmap.de>

pkgname=python-osc
pkgver=1.6.3
pkgrel=3
pkgdesc='Open Sound Control server and client implementations in pure Python'
arch=('any')
url="https://github.com/attwad/python-osc"
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/attwad/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('9c03f90a70c976e1b39f71f032de1fc3e9e6372f0605179f1cddf703baee00989ac3fa6a74de8009d26c1ba1dffbf66586e93c090cd44ebaa6c2badfc84905e1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}/"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -d "${pkgdir}/usr/share/doc/${pkgname}/scripts"
  install -d "${pkgdir}/usr/share/doc/${pkgname}/examples"
  install -Dm644 scripts/*.py "${pkgdir}/usr/share/doc/${pkgname}/scripts/"
  install -Dm644 examples/*.py "${pkgdir}/usr/share/doc/${pkgname}/examples/"
}
