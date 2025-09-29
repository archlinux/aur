# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>

pkgname=ble2mqtt-git
_gitname=ble2mqtt
pkgver=0.2.5.r1.g9ec2940
pkgrel=2
pkgdesc='Bluetooth to MQTT bridge, add your bluetooth-capable devices to your smart home'
url='https://github.com/devbis/ble2mqtt'
arch=('any')
license=('MIT')
depends=('python-pycryptodome' 'python-aio-mqtt-mod' 'python-bleak')
makedepends=('git' 'python-build' 'python-setuptools' 'python-installer' 'python-wheel')
conflicts=('ble2mqtt' 'ble2mqtt-git')
provides=('ble2mqtt')
source=(
    'git+https://github.com/devbis/ble2mqtt.git'
    ble2mqtt.service
)
sha256sums=('SKIP'
            'd638271a618676bad3989f45a02da9f711fa9e1bf8274acd66825fdc1a7bf0f3')

pkgver() {
    cd "$srcdir/$_gitname"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$srcdir/$_gitname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_gitname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 ../ble2mqtt.service "$pkgdir"/usr/lib/systemd/system/ble2mqtt.service

}
