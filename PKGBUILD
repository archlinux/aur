# Maintainer: David Runge <dave@sleepmap.de>

pkgname=python-osc
pkgver=1.6.3
pkgrel=4
pkgdesc='Open Sound Control server and client implementations in pure Python'
arch=('any')
url="https://github.com/attwad/python-osc"
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}::https://github.com/attwad/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('9c03f90a70c976e1b39f71f032de1fc3e9e6372f0605179f1cddf703baee00989ac3fa6a74de8009d26c1ba1dffbf66586e93c090cd44ebaa6c2badfc84905e1')

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
  python setup.py install --skip-build --optimize=1 --prefix=/usr --root="${pkgdir}/"
  install -Dm0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -t "${pkgdir}/usr/share/doc/${pkgname}/scripts/" -Dm644 scripts/*.py
  install -t "${pkgdir}/usr/share/doc/${pkgname}/examples/" -Dm644 examples/*.py
}
