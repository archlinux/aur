# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-cfclient
pkgver=2021.1
pkgrel=1
pkgdesc='Host applications and library for Crazyflie written in Python.'
arch=('any')
url='https://github.com/bitcraze/crazyflie-clients-python'
license=('GPL-2.0')
depends=(python python-cflib python-appdirs python-pyzmq python-pyqtgraph
    python-pyaml python-quamash python-qtm python-numpy python-vispy python-pyqt5)
optdepends=(crazyflie-udev crazyradio-udev)
makedepends=(python python-setuptools python-cx_freeze)
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitcraze/crazyflie-clients-python/archive/$pkgver.tar.gz")
sha256sums=('c1840b4c41f4cc132f5eafc66396d61f59990e8eaf6bfb9410dd33c4b961d06d')

_pkgname=crazyflie-clients-python

prepare() {
    sed -i "s/= get_version()/= \"${pkgver}\"/g" ${srcdir}/${_pkgname}-${pkgver}/setup.py
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
