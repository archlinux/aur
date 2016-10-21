# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=paho.mqtt.python
pkgbase=paho-mqtt
pkgname=(python-$pkgbase python2-$pkgbase)
pkgver=1.2
pkgrel=1
url="http://www.eclipse.org/paho/clients/python"
license=('EPL')
arch=('any')
source=("https://github.com/eclipse/paho.mqtt.python/archive/v1.2.tar.gz")
md5sums=('713dc196d4714baa1c27a72152dabbc3')


prepare() {
    cp -r $_pkgname-${pkgver} py2-$_pkgname-${pkgver}
}

build() {
    cd $srcdir/$_pkgname-${pkgver}
    python setup.py build

    cd $srcdir/py2-$_pkgname-${pkgver}
    python2 setup.py build
}

package_python-paho-mqtt() {
    pkgdesc="Python client library for MQTT v3.1 and v3.1.1"
    depends=('python')

    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-paho-mqtt() {
    pkgdesc="Python 2 client library for MQTT v3.1 and v3.1.1"
    depends=('python2')

    cd $srcdir/py2-$_pkgname-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1
}
