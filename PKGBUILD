# Maintainer: David Runge <dave@sleepmap.de>

pkgname=python-osc
pkgver=1.6
pkgrel=1
pkgdesc='Open Sound Control server and client implementations in pure Python'
arch=('any')
url='https://github.com/attwad/python-osc'
license=('custom')
depends=('python')
makedepends=()
source=("https://github.com/attwad/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('391e1adfe42b89154694406821ad5f451484db4d64f07dbab8fe80e6dc0baab98bec1525c6fc3a9c163cd9bb4847b7bc5b1022ba304a647dc033042cbfc29857')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}/"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -d "${pkgdir}/usr/share/doc/${pkgname}/scripts"
  install -d "${pkgdir}/usr/share/doc/${pkgname}/examples"
  install -Dm644 scripts/*.py "${pkgdir}/usr/share/doc/${pkgname}/scripts/"
  install -Dm644 examples/*.py "${pkgdir}/usr/share/doc/${pkgname}/examples/"
}
