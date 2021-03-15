# Maintainer: Fabio Manganiello <info@fabiomanganiello.com>

pkgname=platypush-git
pkgver=0.20.5.r0.82274d3d
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
sha512sums=('a86c3eaa11674d525c072023710999d2b5da4204405c58fb841ea3314fb95284faedefcefc88354eed4efc7df68f7e7c380ff538ec58927869d51c14c60a7c6b')

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

