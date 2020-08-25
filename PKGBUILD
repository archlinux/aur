# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-cfclient
pkgver=2020.02
pkgrel=3
pkgdesc='Host applications and library for Crazyflie written in Python.'
arch=('any')
url='https://github.com/bitcraze/crazyflie-clients-python'
license=('GPL-2.0')
depends=(python python-cflib python-appdirs python-pyzmq python-pyqtgraph
    python-pyaml python-quamash python-qtm python-pyqt5)
optdepends=(crazyflie-udev crazyradio-udev)
makedepends=(python python-setuptools python-cx_freeze)
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitcraze/crazyflie-clients-python/archive/$pkgver.tar.gz")
sha256sums=('aec8218634ad2ef0ab4a5c2bf9d3e470b6faf959b508199f155cb9497597f3b4')

_pkgname=crazyflie-clients-python

prepare() {
    sed -i "s/= get_version()/= \"${pkgver}\"/g" ${srcdir}/${_pkgname}-${pkgver}/setup.py
    sed -i "s/pyzmq==/pyzmq>=/g" ${srcdir}/${_pkgname}-${pkgver}/setup.py
    sed -i "s/PyYAML==/PyYAML>=/g" ${srcdir}/${_pkgname}-${pkgver}/setup.py
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
