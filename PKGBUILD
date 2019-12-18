# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=system76-firmware-daemon-git
pkgver=1.0.6.r0.g95fa4da
pkgrel=1
pkgdesc="System76 Firmware Daemon provides a daemon for installing firmware updates."
arch=('any')
url="https://github.com/pop-os/system76-firmware"
license=('GPL')
install=system76-firmware-daemon.install
depends=('dbus' 'systemd' 'openssl-1.0')
makedepends=('rust')
conflicts=('system76-driver<=17.10.32' 'system76-firmware-daemon')
provides=('system76-firmware-daemon')
source=("${pkgname}::git://github.com/pop-os/system76-firmware.git"
		"system76-firmware-daemon.install")
sha256sums=('SKIP'
            '1d2604a2d4273adf05752529d6af917abba7e64d9e04e3519d9c438632cfcf5b')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"

	make
}

package() {
	cd "${srcdir}/${pkgname}"

	make DESTDIR="${pkgdir}" install
}
