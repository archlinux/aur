# Maintainer: Fabio Manganiello <info@fabiomanganiello.com>

_pkgname=platypush
pkgname=${_pkgname}-git
pkgver=0.13.9.r0.0c0e7411
pkgrel=1
pkgdesc="Universal multi-platform command executor and automation manager"
arch=('any')
license=('MIT')
url="https://github.com/BlackLight/platypush"
depends=('python' 'python-yaml' 'redis' 'python-redis' 'python-requests' 'python-sqlalchemy' 'python-websockets' 'python-websocket-client' 'python-wheel' 'python-flask'
	'python-pip' 'python-dateutil' 'python-frozendict' 'python-bcrypt' 'python-zeroconf')
optdepends=('python-paho-mqtt: MQTT integrations support'
	'python-pybluez: Bluetooth support'
	'python-gattlib: Low-energy Bluetooth devices support'
	'python-paramiko: SSH support'
    'python-croniter: Platypush cron support'
	'python-pyserial: Arduino/serial device support')
conflicts=('platypush')
options=(!strip)
source=("${_pkgname}.tar.gz::https://github.com/BlackLight/${_pkgname}/archive/master.tar.gz")
sha512sums=('b52704441ffbe72afb3f5417991cf49983253fd11f7051b07785ec7796e6382a850cf6f32abb7b7503ea2a452815796ec67cafc2695b66804142265bd94ff99b')

package() {
    cd "${srcdir}/${_pkgname}-master"
    python3 setup.py install --root="${pkgdir}/" --optimize=1

    install -m755 -d "${pkgdir}/usr/lib/systemd/user"
    install -m644 "${srcdir}/${_pkgname}-master/examples/systemd/platypush.service" "${pkgdir}/usr/lib/systemd/user"

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

