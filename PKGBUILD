# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-cfclient
pkgver=2023.2
pkgrel=1
pkgdesc='Host applications and library for Crazyflie written in Python.'
arch=('any')
url='https://github.com/bitcraze/crazyflie-clients-python'
license=('GPL-2.0')
depends=(python python-cflib python-appdirs python-pyzmq python-pyqtgraph
         python-pyaml python-asyncqt python-qtm python-numpy python-vispy
         python-pyserial python-pyqt5 python-pyqt5-sip)
optdepends=(crazyflie-udev crazyradio-udev)
makedepends=(python python-build python-installer python-wheel python-setuptools
             python-cx-freeze python-importlib-metadata)
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitcraze/crazyflie-clients-python/archive/$pkgver.tar.gz")
sha256sums=('c86533892b32d2e41240375eaaa523f71d54efd0dc74b207ab0dcd4eea1bbc27')

_pkgname=crazyflie-clients-python

prepare() {
    sed -i "s/= get_version()/= \"${pkgver}\"/g" ${srcdir}/${_pkgname}-${pkgver}/setup.py
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
