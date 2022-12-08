# Maintainer: Fabio Manganiello <fabio@manganiello.tech>

pkgname=platypush
pkgver=0.24.2
pkgrel=1
pkgdesc="Universal multi-platform command executor and automation manager"
arch=('any')
license=('MIT')
url="https://git.platypush.tech/platypush/platypush"
depends=('python' 'python-yaml' 'redis' 'python-redis' 'python-requests' 'python-sqlalchemy' 'python-websockets' 'python-websocket-client' 'python-wheel' 'python-flask' 'python-pip' 'python-dateutil' 'python-frozendict' 'python-bcrypt' 'python-zeroconf' 'python-rsa' 'python-croniter' 'python-marshmallow' 'python-pytz' 'python-magic')
optdepends=('python-paho-mqtt: MQTT integrations support'
	'python-pybluez: Bluetooth support'
	'python-gattlib: Low-energy Bluetooth devices support'
	'python-paramiko: SSH support'
	'python-watchdog: File monitor support'
	'python-aiohttp: SmartThings support'
	'python-pyserial: Arduino/serial device support')
options=(!strip)
source=("v${pkgver}.tar.gz::https://git.platypush.tech/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('5ec96d617c32c7caf7fb937ed32c28efb2dbd01b8cb2462f012a2a6b531188bfedc9e87e66837736a4a3b17bd4d4fd8decef7c3852655c181d7bbc8881374eab')

package() {
    cd "${srcdir}/${pkgname}"
    python3 setup.py build install --root="${pkgdir}/" --optimize=1

    install -m755 -d "${pkgdir}/usr/lib/systemd/user"
    install -m644 "${srcdir}/${pkgname}/examples/systemd/platypush.service" "${pkgdir}/usr/lib/systemd/user"

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

