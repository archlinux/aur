# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-collada
pkgver=0.7.2
pkgrel=2
pkgdesc="python library for reading and writing collada documents"
arch=(any)
url="https://github.com/pycollada/pycollada"
license=('BSD')
depends=(python python-dateutil python-numpy python-lxml)
makedepends=(python-setuptools)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/pycollada/pycollada/archive/v${pkgver}.tar.gz)
sha512sums=('5c21155d52d54de62d192d4da0385bc7110ddd3962fe3e0e9e5904bbcd0e66cb1a95765c9996cdc5beef0edb30ee2123ae23b904d029be1c119e902d2fc4e7fe')

build() {
  cd "pycollada-${pkgver}"
  python setup.py build
}

check() {
  cd "pycollada-${pkgver}/collada"
  PYTHONPATH=../ python -m unittest discover tests
}

package() {
  cd "pycollada-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
