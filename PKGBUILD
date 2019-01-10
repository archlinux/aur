# Maintainer: David Runge <dave@sleepmap.de>

pkgname=python-osc
pkgver=1.7.0
pkgrel=1
pkgdesc='Open Sound Control server and client implementations in pure Python'
arch=('any')
url="https://github.com/attwad/python-osc"
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('2063f97fb353e09adb146d9a801df94125fdd899536bd5815c99dcdf22976c0e20aa647f4b073086b76cd82643705c51a62ff6bdaa572121070c3d92e8334fdb')

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
