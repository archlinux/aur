# Maintainer: David Runge <dave@sleepmap.de>

pkgname=python-osc
pkgver=1.7.2
pkgrel=1
pkgdesc='Open Sound Control server and client implementations in pure Python'
arch=('any')
url="https://github.com/attwad/python-osc"
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('0bc0eb62838d5101f88529164fb9e7a12b58c9f15ea6bc31ed6c06563c2971cc55fc8d47bc845bb0408ff01c3a1bd03a3b31d168aeb3dfbeb586aea514d60394')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  python setup.py test
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}/"

  install -vDm 644 LICENSE.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
