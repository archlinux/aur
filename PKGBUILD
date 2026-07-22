# Maintainer: Patrick Mang <aur at patrickmang dot de>

pkgname=goscrobble
pkgver=0.8.0
pkgrel=1
pkgdesc="A simple, cross-platform music scrobbler daemon."
arch=(x86_64)
url="https://github.com/p-mng/goscrobble"
license=("custom:MIT")
depends=(dbus)
makedepends=(go)
source=("goscrobble-v${pkgver}.tar.gz::https://github.com/p-mng/goscrobble/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('91c16c5737e2cea5a82b9502506409a77297b05189c3824867d458e1de213553')

build() {
	cd "${srcdir}/goscrobble-${pkgver}"

	go build -v .
}

package() {
	cd "${srcdir}/goscrobble-${pkgver}"

	export GOSCROBBLE_PATH="/usr/bin/goscrobble"
	envsubst < "scripts/goscrobble.service" > "goscrobble.service"

	install -Dm755 "goscrobble" "${pkgdir}/usr/bin/goscrobble"
	install -Dm644 "goscrobble.service" -t "${pkgdir}/usr/lib/systemd/user/"
	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
