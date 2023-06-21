# Maintainer: Stetsed <aur.arch@stetsed.xyz>
pkgname=batterylog-git
pkgver=r15.4ae8059
pkgrel=3
pkgdesc="Battery logging tool (git version)"
arch=('any')
url="https://github.com/lhl/batterylog"
license=('GPL-3.0')
depends=('python' 'sqlite3')
makedepends=('git')
source=("git+https://github.com/lhl/batterylog.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/batterylog"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/batterylog"
}

package() {
	cd "$srcdir/batterylog"

	sqlite3 batterylog.db <schema.sql

	install -Dm755 batterylog.system-sleep "$pkgdir/usr/lib/systemd/system-sleep/batterylog"

	install -d "$pkgdir/opt/batterylog"
	cp -r . "$pkgdir/opt/batterylog"
}
