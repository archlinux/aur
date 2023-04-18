# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=system76-firmware-daemon-git
pkgver=1.0.52.r0.g5180b1e
pkgrel=1
pkgdesc="System76 Firmware Daemon provides a daemon for installing firmware updates."
arch=('any')
url="https://github.com/pop-os/system76-firmware"
license=('GPL')
depends=('dbus' 'systemd' 'openssl-1.0')
makedepends=('rust')
conflicts=('system76-driver<=17.10.32' 'system76-firmware-daemon')
provides=('system76-firmware-daemon')
source=("${pkgname}::git+https://github.com/pop-os/system76-firmware.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
    cd "${srcdir}/${pkgname}"

    make
}

package() {
    cd "${srcdir}/${pkgname}"

    make DESTDIR="${pkgdir}" install
}
