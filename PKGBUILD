# Maintainer: Patrick Mang <aur at patrickmang dot de>

pkgname=goscrobble
pkgver=0.4.0
pkgrel=1
pkgdesc="A simple music scrobbler daemon for MPRIS-based music players."
arch=(x86_64)
url="https://github.com/p-mng/goscrobble"
license=("custom:MIT")
depends=(dbus)
makedepends=(go)
source=("goscrobble-v${pkgver}.tar.gz::https://github.com/p-mng/goscrobble/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('20a5666e3b96acb09b5101f51158742a5f1522fab3a5091e4fcf5626eca2af28')

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
