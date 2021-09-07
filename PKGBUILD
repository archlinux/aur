# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-cfclient
pkgver=2021.6.1
pkgrel=2
pkgdesc='Host applications and library for Crazyflie written in Python.'
arch=('any')
url='https://github.com/bitcraze/crazyflie-clients-python'
license=('GPL-2.0')
depends=(python python-cflib python-appdirs python-pyzmq python-pyqtgraph
         python-pyaml python-quamash python-qtm python-numpy python-vispy
         python-pyserial python-pyqt5)
optdepends=(crazyflie-udev crazyradio-udev)
makedepends=(python python-setuptools python-cx_freeze)
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitcraze/crazyflie-clients-python/archive/$pkgver.tar.gz")
sha256sums=('f0df15f48bf0c638cbf50ade479fb7c243d8ca5b015128b0a95c26fbc02c5462')

_pkgname=crazyflie-clients-python

prepare() {
    sed -i "s/= get_version()/= \"${pkgver}\"/g" ${srcdir}/${_pkgname}-${pkgver}/setup.py
    sed -i "s/~/>/g" ${srcdir}/${_pkgname}-${pkgver}/setup.py
    sed -i "20i'bin_path_includes': ['/usr/lib/python3.9/site-packages/cx_Freeze/bases']," ${srcdir}/${_pkgname}-${pkgver}/setup.py
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
