# Maintainer: Fabio Manganiello <info@fabiomanganiello.com>

pkgname=platypush
pkgver=0.20.10
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
sha512sums=('8dda85979dc6b9b8643f4e8b96ee0bf05da09341d4be5bfdfa36cd3bd05b01852beec9e16a675baeddd64c247ea95382f86e6bbfc083308ffb8bb748c890aa12')

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

