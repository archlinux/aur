# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-collada
pkgver=0.7.1
pkgrel=1
pkgdesc="python library for reading and writing collada documents"
arch=(any)
url="https://github.com/pycollada/pycollada"
license=('BSD')
depends=(python python-dateutil python-numpy python-lxml)
makedepends=(python-setuptools)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/pycollada/pycollada/archive/v${pkgver}.tar.gz)
sha512sums=('ac4d88b2398bf0364beaaf3e2e468be9131dc0f8088bfce8be18d9eb5a7c093db84a364931884fa7c493dfae81036ec63bc7c689ebf49e961eefc0c4853a0131')

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
