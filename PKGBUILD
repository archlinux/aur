# Maintainer: Patrick Mang <aur at patrickmang dot de>

pkgname=goscrobble
pkgver=0.5.0
pkgrel=1
pkgdesc="A simple, cross-platform music scrobbler daemon."
arch=(x86_64)
url="https://github.com/p-mng/goscrobble"
license=("custom:MIT")
depends=(dbus)
makedepends=(go)
source=("goscrobble-v${pkgver}.tar.gz::https://github.com/p-mng/goscrobble/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('90ea6f3b6cdb1c1109d371f98b41e1efcbffd8426b1480bec5aca3874466230a')

build() {
	cd "${srcdir}/goscrobble-${pkgver}"

	go build -v .
}

package() {
	cd "${srcdir}/goscrobble-${pkgver}"

	install -Dm755 "goscrobble" "${pkgdir}/usr/bin/goscrobble"
	install -Dm644 "goscrobble.service" -t "${pkgdir}/usr/lib/systemd/user/"
	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
