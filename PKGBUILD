# Maintainer: Fabio Manganiello <info@fabiomanganiello.com>

pkgname=platypush-git
pkgver=0.20.0.r0.61c5bae5
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
conflicts=('platypush')
provides=('platypush')
options=(!strip)
source=("platypush.tar.gz::https://git.platypush.tech/platypush/platypush/-/archive/master/platypush-master.tar.gz")
sha512sums=('0a810eaeb22144a8fdb402dba3267e57a1135b3c5ecbb74e7aa479b884904841f08b657c13d749cdf99bf1d9eeabd8d821855b28abb0d465124da9b385767d0d')

package() {
    cd "${srcdir}/platypush-master"
    python3 setup.py install --root="${pkgdir}/" --optimize=1

    install -m755 -d "${pkgdir}/usr/lib/systemd/user"
    install -m644 "${srcdir}/platypush-master/examples/systemd/platypush.service" "${pkgdir}/usr/lib/systemd/user"

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

