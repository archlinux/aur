# Maintainer: Fabio Manganiello <info@fabiomanganiello.com>

pkgname=platypush
pkgver=0.22.1
pkgrel=1
pkgdesc="Universal multi-platform command executor and automation manager"
arch=('any')
license=('MIT')
url="https://git.platypush.tech/platypush/platypush"
depends=('python' 'python-yaml' 'redis' 'python-redis' 'python-requests' 'python-sqlalchemy' 'python-websockets' 'python-websocket-client' 'python-wheel' 'python-flask' 'python-pip' 'python-dateutil' 'python-frozendict' 'python-bcrypt' 'python-zeroconf' 'python-pyjwt' 'python-croniter' 'python-marshmallow' 'python-pytz')
optdepends=('python-paho-mqtt: MQTT integrations support'
	'python-pybluez: Bluetooth support'
	'python-gattlib: Low-energy Bluetooth devices support'
	'python-paramiko: SSH support'
	'python-watchdog: File monitor support'
	'python-aiohttp: SmartThings support'
	'python-pyserial: Arduino/serial device support')
options=(!strip)
source=("${pkgname}-v${pkgver}.tar.gz::https://git.platypush.tech/${pkgname}/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('80e42dd753ecc7a6c7beca8e3ce7185e7084fff1a5dd790a15f7b09f4017bdb90768913ca3029be4e301c9d93722540a2be361daae5c2b39b79e5e139a66bc4b')

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

