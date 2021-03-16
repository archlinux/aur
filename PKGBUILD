# Maintainer: Librewish <librewish AT gmail.com>

_pkgname=memavaild
pkgname=${_pkgname}-git
pkgver=0.6.r3.g2603a8c
pkgrel=1
pkgdesc="Improve responsiveness during heavy swapping: keep amount of available memory."
arch=('any')
url="https://github.com/hakavlad/memavaild"
license=('MIT')
source=(
	"$pkgname::git+https://github.com/hakavlad/memavaild.git#branch=master"
)
md5sums=('SKIP')
depends=(
	'python'
)

makedepends=(
	'git'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install=${_pkgname}.install
backup=(
	'etc/memavaild.conf'
)

pkgver() {
	cd "${srcdir}/${pkgname}" || exit 2
	set -o pipefail
	git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/${pkgname}" || exit 2
	make \
		DESTDIR="${pkgdir}" \
		PREFIX="/usr" \
		SBINDIR="/usr/bin" \
		SYSCONFDIR="/etc" \
		SYSTEMDUNITDIR="/usr/lib/systemd/system" \
		install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
