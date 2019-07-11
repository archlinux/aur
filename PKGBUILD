# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgbase=python-plasmalights
pkgname=('python-plasmalights' 'python2-plasmalights')
_name=${pkgname#python-}
pkgver=0.0.1
pkgrel=1
pkgdesc="Plasma LED driver, FX Sequencer and plugins for Pimoroni."
arch=('any')
url="https://github.com/pimoroni/plasma"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

sha512sums=('55c45372f85dd4659356e25ab837e9f47bd20b456d657e5637452418e2e3a7b493e84fa75baf79ca38659f24ae02daac2d562f76c9842f3c74c407c487da0c5e')

prepare() {
  cp -a plasmalights-$pkgver{,-py2}
}

build() {
  cd "${srcdir}"/plasmalights-${pkgver}
  python setup.py build

  cd "${srcdir}"/plasmalights-${pkgver}-py2
  python2 setup.py build
}

package_python-plasmalights() {
  cd plasmalights-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-plasmalights() {
  cd plasmalights-${pkgver}-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
