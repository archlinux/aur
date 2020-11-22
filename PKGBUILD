# Maintainer: Librewish <librewish AT gmail.com>

_pkgname=memavaild
pkgname=${_pkgname}
pkgver=0.6
pkgrel=1
pkgdesc="Improve responsiveness during heavy swapping: keep amount of available memory."
arch=('any')
url="https://github.com/hakavlad/memavaild"
license=('MIT')
source=(
	"$pkgname::https://github.com/hakavlad/memavaild/archive/v${pkgver}.tar.gz"
)
md5sums=('SKIP')
depends=(
	'python'
)
conflicts=("${_pkgname}")
install=${_pkgname}.install
backup=(
	'etc/memavaild.conf'
)

package() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit 2
	make \
		DESTDIR="${pkgdir}" \
		PREFIX="/usr" \
		SBINDIR="/usr/bin" \
		SYSCONFDIR="/etc" \
		SYSTEMDUNITDIR="/usr/lib/systemd/system" \
		install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
