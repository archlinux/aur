# Maintainer: Patrick Mang <aur at patrickmang dot de>

pkgname=goscrobble
pkgver=0.2.1
pkgrel=1
pkgdesc="A simple music scrobbler daemon for MPRIS-based music players."
arch=(x86_64)
url="https://github.com/p-mng/goscrobble"
license=("custom:MIT")
depends=(dbus)
makedepends=(go)
source=("goscrobble-v${pkgver}.tar.gz::https://github.com/p-mng/goscrobble/archive/refs/tags/v${pkgver}.tar.gz"
        "goscrobble.service")
sha256sums=('d85796217043796dcda982caf080c33a54a8d635c015416b686390fbc58cbbd1'
            '5a8cd735c63071612011a7cacfbc2df1ecc3ea54cc66fd494dbd5c0fac95d80c')

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
