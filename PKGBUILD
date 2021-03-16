# Maintainer: Librewish <librewish AT gmail.com>

_pkgname=nohang
pkgname=${_pkgname}
pkgver=0.2.0
pkgrel=1
pkgdesc="A sophisticated low memory handler."
arch=('any')
url="https://github.com/hakavlad/nohang"
license=('MIT')
source=(
	"$pkgname::https://github.com/hakavlad/nohang/archive/v${pkgver}.tar.gz"
)
md5sums=('SKIP')
depends=(
	'python'
)

conflicts=("${_pkgname}")
backup=(
	'etc/nohang/nohang.conf'
	'etc/nohang/nohang-desktop.conf'
	'etc/logrotate.d/nohang'
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
