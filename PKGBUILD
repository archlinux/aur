# Maintainer: Patrick Mang <aur at patrickmang dot de>

pkgname=goscrobble
pkgver=0.6.0
pkgrel=1
pkgdesc="A simple, cross-platform music scrobbler daemon."
arch=(x86_64)
url="https://github.com/p-mng/goscrobble"
license=("custom:MIT")
depends=(dbus)
makedepends=(go)
source=("goscrobble-v${pkgver}.tar.gz::https://github.com/p-mng/goscrobble/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5100d525d845ad3db187f3c98810f963656c69aa86d104f0e2badb341e378387')

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
