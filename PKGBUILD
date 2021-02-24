# Maintainer: Fabio Manganiello <info@fabiomanganiello.com>

pkgname=platypush
pkgver=0.20.0
pkgrel=1
pkgdesc="Universal multi-platform command executor and automation manager"
arch=('any')
license=('MIT')
url="https://git.platypush.tech/platypush/platypush"
depends=('python' 'python-yaml' 'redis' 'python-redis' 'python-requests' 'python-sqlalchemy' 'python-websockets' 'python-websocket-client' 'python-wheel' 'python-flask' 'python-pip' 'python-dateutil' 'python-frozendict' 'python-bcrypt' 'python-zeroconf' 'python-pyjwt' 'python-croniter')
optdepends=('python-paho-mqtt: MQTT integrations support'
	'python-pybluez: Bluetooth support'
	'python-gattlib: Low-energy Bluetooth devices support'
	'python-paramiko: SSH support'
	'python-pyserial: Arduino/serial device support')
options=(!strip)
source=("${pkgname}-v${pkgver}.tar.gz::https://git.platypush.tech/${pkgname}/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('8fb6037bd57a971e92fd93d8886653af525b4a009413cd8c9ec0a8a33ada625b7feb956eba5f2a5bb8664dde9e26de77e4546fd9a38e52c7496c76decc60ae7f')

package() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    python3 setup.py build install --root="${pkgdir}/" --optimize=1

    install -m755 -d "${pkgdir}/usr/lib/systemd/user"
    install -m644 "${srcdir}/${pkgname}-v${pkgver}/examples/systemd/platypush.service" "${pkgdir}/usr/lib/systemd/user"

    echo
    echo
    echo ---------------------------------------------
    echo You can start the Platypush service through
    echo systemctl --user start platypush.
    echo
    echo Remember to enable/start the Redis service
    echo before starting Platypush.
    echo ---------------------------------------------
    echo
    echo
}

