# Maintainer: Lucas Mindello <lucas at mindello dot com dot br>
pkgname=homeassistant-supervised
pkgver=1.5.0
pkgrel=1
pkgdesc="Home Assistant Supervised"
arch=('any')
url="https://www.home-assistant.io/"
license=('APACHE')
depends=(
    'docker>=20.10'
    'systemd>=239'
    'jq'
    'wget'
    'curl'
    'udisks2'
    'glib2'
    'dbus'
    'homeassistant-osagent'
)
optdepends=("networkmanager: support for built-in network management"
            "apparmor: enhanced security")
makedepends=('git')
conflicts=('docker-desktop')
install=.INSTALL
backup=(etc/docker/daemon.json)
_tag=06671c39bd5c81fd213330597fbf9c7dd9a36e78 # git rev-parse "$pkgver"
source=("git+https://github.com/home-assistant/supervised-installer.git#tag=${_tag}")
md5sums=('SKIP')

package() {
	install -Dm755 "${srcdir}/supervised-installer/homeassistant-supervised/usr/bin/ha" "${pkgdir}/usr/bin/ha"
    install -Dm755 "${srcdir}/supervised-installer/homeassistant-supervised/usr/sbin/hassio-apparmor" "${pkgdir}/usr/bin/hassio-apparmor"
    install -Dm755 "${srcdir}/supervised-installer/homeassistant-supervised/usr/sbin/hassio-supervisor" "${pkgdir}/usr/bin/hassio-supervisor"
    install -Dm644 "${srcdir}/supervised-installer/homeassistant-supervised/etc/NetworkManager/NetworkManager.conf" "${pkgdir}/etc/NetworkManager/conf.d/hassio.conf"
    install -Dm644 "${srcdir}/supervised-installer/homeassistant-supervised/etc/docker/daemon.json" "${pkgdir}/etc/docker/daemon.json"
    install -Dm644 "${srcdir}/supervised-installer/homeassistant-supervised/etc/systemd/system/hassio-apparmor.service" "${pkgdir}/usr/lib/systemd/system/hassio-apparmor.service"
    install -Dm644 "${srcdir}/supervised-installer/homeassistant-supervised/etc/systemd/system/hassio-supervisor.service" "${pkgdir}/usr/lib/systemd/system/hassio-supervisor.service"
    install -Dm644 "${srcdir}/supervised-installer/homeassistant-supervised/usr/share/hassio/apparmor/hassio-supervisor" "${pkgdir}/usr/share/hassio/apparmor/hassio-supervisor"
    install -Dm644 "${srcdir}/supervised-installer/homeassistant-supervised/etc/systemd/system/systemd-journal-gatewayd.socket.d/10-hassio-supervisor.conf" "${pkgdir}/etc/systemd/system/systemd-journal-gatewayd.socket.d/10-hassio-supervisor.conf"
}
