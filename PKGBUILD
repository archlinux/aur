# Maintainer: David Runge <dave@sleepmap.de>

pkgname=python-osc
pkgver=1.6.4
pkgrel=1
pkgdesc='Open Sound Control server and client implementations in pure Python'
arch=('any')
url="https://github.com/attwad/python-osc"
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/attwad/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('775a425c7b3e59de754800e5e0e91878af8bc55d43959a78adf89d3698ed760f383bf139e87437bb7e3373caa5773e10321c9e083e9275b184a89355606e852c')

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
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}/"

  install -Dm0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -t "${pkgdir}/usr/share/doc/${pkgname}/scripts/" -Dm644 scripts/*.py
  install -t "${pkgdir}/usr/share/doc/${pkgname}/examples/" -Dm644 \
    examples/*.py

}
