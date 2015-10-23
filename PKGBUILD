# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgbase=paho-mqtt
pkgname=(python-$pkgbase python2-$pkgbase)
pkgver=1.1
pkgrel=2
url="http://www.eclipse.org/paho/clients/python"
license=('EPL')
arch=('any')
source=("https://pypi.python.org/packages/source/p/paho-mqtt/paho-mqtt-$pkgver.tar.gz")
md5sums=('a6407b74eb5e5411e157be1de5c11366')


prepare() {
   cp -r $pkgbase-${pkgver} python2-$pkgbase-${pkgver}
}

build() {
   cd $srcdir/$pkgbase-${pkgver}
   python setup.py build

   cd $srcdir/python2-$pkgbase-${pkgver}
   python2 setup.py build
}

package_python-paho-mqtt() {
    pkgdesc="Python client library for MQTT v3.1 and v3.1.1"
    depends=('python')

    cd $srcdir/$pkgbase-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-paho-mqtt() {
    pkgdesc="Python 2 client library for MQTT v3.1 and v3.1.1"
    depends=('python2')

    cd $srcdir/python2-$pkgbase-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1
}
