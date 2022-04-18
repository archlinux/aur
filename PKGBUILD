# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-cfclient
pkgver=2022.3
pkgrel=1
pkgdesc='Host applications and library for Crazyflie written in Python.'
arch=('any')
url='https://github.com/bitcraze/crazyflie-clients-python'
license=('GPL-2.0')
depends=(python python-cflib python-appdirs python-pyzmq python-pyqtgraph
         python-pyaml python-asyncqt python-qtm python-numpy python-vispy
         python-pyserial python-pyqt5 python-pyqt5-sip)
optdepends=(crazyflie-udev crazyradio-udev)
makedepends=(python python-setuptools python-cx-freeze python-importlib-metadata)
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitcraze/crazyflie-clients-python/archive/$pkgver.tar.gz")
sha256sums=('a37581c6e87e9c026d063b2cba47d27bf5c3c766dced9d7cc38febbcc5ee521d')

_pkgname=crazyflie-clients-python

prepare() {
    sed -i "s/= get_version()/= \"${pkgver}\"/g" ${srcdir}/${_pkgname}-${pkgver}/setup.py
    sed -i "20i'bin_path_includes': ['/usr/lib/python3.10/site-packages/cx_Freeze/bases']," ${srcdir}/${_pkgname}-${pkgver}/setup.py
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
