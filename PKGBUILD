# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgbase=paho-mqtt
pkgname=("python-${pkgbase}" "python2-${pkgbase}")
pkgver=1.3.1
pkgrel=1
url="http://www.eclipse.org/paho/clients/python"
makedepends=('python' 'python2')
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
    python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-paho-mqtt() {
    pkgdesc="Python 2 client library for MQTT v3.1 and v3.1.1"
    depends=('python2')

    cd "${srcdir}/py2-${pkgbase}-${pkgver}"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
sha256sums=('31911f6031de306c27ed79dc77b690d7c55b0dcb0f0434ca34ec6361d0371122')
