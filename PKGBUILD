# Maintainer: Lucas Mindello <lucas at mindello dot com dot br>
pkgname=homeassistant-supervised
pkgver=1.4.1
pkgrel=1
pkgdesc="Home Assistant Supervised"
arch=('x86_64')
url="https://www.home-assistant.io/"
license=('APACHE')
depends=(
    'docker>=20.10'
    'systemd>=239'
    'networkmanager>=1.14.6'
    'apparmor'
    'jq'
    'wget'
    'curl'
    'udisks2'
    'glib2'
    'dbus'
    'homeassistant-osagent'
)
makedepends=('git')
conflicts=('docker-desktop')
install=.INSTALL
backup=(etc/docker/daemon.json)
_tag=730bf01008d67ba3b2936a274d0abbeabc807fa5 # git rev-parse "$pkgver"
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
}
