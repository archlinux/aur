# Maintainer: Patrick Mang <aur at patrickmang dot de>

pkgname=goscrobble
pkgver=0.3.1
pkgrel=1
pkgdesc="A simple music scrobbler daemon for MPRIS-based music players."
arch=(x86_64)
url="https://github.com/p-mng/goscrobble"
license=("custom:MIT")
depends=(dbus)
makedepends=(go)
source=("goscrobble-v${pkgver}.tar.gz::https://github.com/p-mng/goscrobble/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cbb2ec7cd7efe9b2cc0eeab778c68db4bb1aad15eb12a2812fe7086225bf02e4')

build() {
	cd "${srcdir}/goscrobble-${pkgver}"

	CGO_ENABLED=0 go build -v ./...
}

package() {
	cd "${srcdir}/goscrobble-${pkgver}"

	install -Dm755 "goscrobble" "${pkgdir}/usr/bin/goscrobble"
	install -Dm644 "goscrobble.service" -t "${pkgdir}/usr/lib/systemd/user/"
	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
