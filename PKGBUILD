# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgbase=paho-mqtt
pkgname=("python-${pkgbase}" "python2-${pkgbase}")
pkgver=1.4.0
pkgrel=1
url="http://www.eclipse.org/paho/clients/python"
makedepends=('python-setuptools' 'python2-setuptools')
license=('EPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgbase::1}/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")


prepare() {
    cp -r "${pkgbase}-${pkgver}" "py2-${pkgbase}-${pkgver}"
}

build() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    python setup.py build

    cd "${srcdir}/py2-${pkgbase}-${pkgver}"
    python2 setup.py build
}

package_python-paho-mqtt() {
    pkgdesc="Python client library for MQTT v3.1 and v3.1.1"
    depends=('python')

    cd "${srcdir}/${pkgbase}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-paho-mqtt() {
    pkgdesc="Python 2 client library for MQTT v3.1 and v3.1.1"
    depends=('python2')

    cd "${srcdir}/py2-${pkgbase}-${pkgver}"
    python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
sha256sums=('e440a052b46d222e184be3be38676378722072fcd4dfd2c8f509fb861a7b0b79')
