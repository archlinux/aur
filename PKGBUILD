# Maintainer: Librewish <librewish AT gmail.com>

_pkgname=prelockd
pkgname=${_pkgname}
pkgver=0.8
pkgrel=1
pkgdesc="prelockd is a daemon that locks memory mapped binaries and libraries in memory to improve system responsiveness under low-memory conditions."
arch=('any')
url="https://github.com/hakavlad/prelockd"
license=('MIT')
source=(
	"$pkgname::https://github.com/hakavlad/prelockd/archive/v${pkgver}.tar.gz"
)
md5sums=('SKIP')
depends=(
	'python'
)

conflicts=("${_pkgname}")
install=${_pkgname}.install
backup=(
	'etc/prelockd.conf'
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
