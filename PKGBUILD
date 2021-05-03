# Maintainer: Zauberfisch <aur at zauberfisch dot at>

pkgname=rdircd-git
pkgver=r221.e8537ed
pkgrel=1
pkgdesc="Reliable Discord-client IRC Daemon written in python3 (rdircd)"
arch=("any")
url="https://github.com/mk-fg/reliable-discord-client-irc-daemon"
license=("WTFPL")
source=(
	"${pkgname}::git+https://github.com/mk-fg/reliable-discord-client-irc-daemon.git#branch=master"
	"rdircd.service"
	"config.ini"
	"state.ini"
)
sha256sums=(
	'SKIP'
	'bba98e629a1bbba944693cdf640d94827112d6885feada8528c6747ab648976c'
	'271b711c369d45571dda0538ec264badcab8974cd0e6bede57ee12a31c639b20'
	'aedf0862ba99a38135bf58fc4fcf78fffa8874cba9b2f96039c62ed8ae7bc3fc'
)
depends=(python python-aiohttp)
makedepends=(git)
conflicts=('rdircd')
provides=('rdircd')
backup=(
	'var/lib/rdircd/config.ini'
	'var/lib/rdircd/state.ini'
)
install=$pkgname.install

pkgver() {
	cd "${srcdir}/${pkgname}" || exit 2
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm644 "${srcdir}/rdircd.service" "${pkgdir}/usr/lib/systemd/system/rdircd.service"
	install -Dm644 "${srcdir}/config.ini" "${pkgdir}/var/lib/rdircd/config.ini"
	install -Dm644 "${srcdir}/state.ini" "${pkgdir}/var/lib/rdircd/state.ini"
	install -Dm755 "${srcdir}/${pkgname}/${pkgname%-git}" "${pkgdir}/usr/bin/rdircd"
	install -Dm644 "${srcdir}/${pkgname}/COPYING" "${pkgdir}/usr/share/licenses/rdircd/LICENSE"
}

