# Maintainer: Lars Niesen <lars.niesen@gmx.de>
pkgname=splan-notify-git
_name="${pkgname%-git}"
pkgver() { git -C "$_name" describe --tags | sed 's/^v//;s/-/.r/;s/-/./g'; }
pkgver=1.0.r1.g1c6718f
pkgrel=1

pkgdesc="Easily get Notifications from the StarPlaner timetables"
arch=('any')
url="https://github.com/TripleTrable/$_name"
license=('MIT')
depends=('curl' 'awk' 'libnotify' 'grep')
makedepends=('git')
source=("git+$url")
md5sums=('SKIP')

build() {
	cd "$_name"
	make ttParser
}

package() {
	cd "$_name"
	make PREFIX="/usr" DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
