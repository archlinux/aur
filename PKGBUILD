# Maintainer: Zauberfisch <aur at zauberfisch dot at>

pkgname=rdircd-git
pkgver=r148.d7ba4df
pkgrel=3
pkgdesc="Reliable Discord-client IRC Daemon written in python3 (rdircd)"
arch=("any")
url="https://github.com/mk-fg/reliable-discord-client-irc-daemon"
license=("WTFPL")
source=(
	"${pkgname}::git+https://github.com/mk-fg/reliable-discord-client-irc-daemon.git#branch=master"
	"rdircd.service"
	"rdircd.ini"
)
sha256sums=(
	'SKIP'
	'f2b1cf999cdf45d5e475c3ba4503a4df378d74fab21b742dcee474faa5f2efb1'
	'271b711c369d45571dda0538ec264badcab8974cd0e6bede57ee12a31c639b20'
)
depends=(python python-aiohttp)
makedepends=(git)
conflicts=('rdircd')
provides=('rdircd')
backup=('var/lib/rdircd/config.ini')
install=$pkgname.install

pkgver() {
	cd "${srcdir}/${pkgname}" || exit 2
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm644 "${srcdir}/rdircd.service" "${pkgdir}/usr/lib/systemd/system/rdircd.service"
	install -Dm644 "${srcdir}/rdircd.ini" "${pkgdir}/var/lib/rdircd/config.ini"
	install -Dm755 "${srcdir}/${pkgname}/${pkgname%-git}" "${pkgdir}/usr/bin/rdircd"
	install -Dm644 "${srcdir}/${pkgname}/COPYING" "${pkgdir}/usr/share/licenses/rdircd/LICENSE"
}

