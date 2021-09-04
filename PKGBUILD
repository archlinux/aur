# Maintainer: YTG123 <ytg1234@pm.me>
_pkgname=touchcursor-linux
pkgname=touchcursor-linux-git
pkgver=r96.1383893
pkgrel=1
pkgdesc="TouchCursor style keyboard remapping for Linux, Git version."
arch=("any")
url=https://github.com/donniebreve/touchcursor-linux
license=('GPL2')
makedepends=('git')
depends=('glibc')
provides=('touchcursor-linux')
conflicts=('touchcursor-linux')
source=("git+https://github.com/donniebreve/$_pkgname")
md5sums=("SKIP")

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	make OUTPATH="./out" TARGET="touchcursor"
}

package() {
	cd "$_pkgname"
	install -Dm4755 out/touchcursor "$pkgdir/usr/bin/touchcursor"
	install -Dm644 touchcursor.conf "$pkgdir/etc/touchcursor/touchcursor.conf"
	install -Dm644 touchcursor.service "$pkgdir/usr/lib/systemd/user/touchcursor.service"
}
