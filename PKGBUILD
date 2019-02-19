# Maintainer: Moritz Bruder <muesli4 at gmail dot com>
pkgname=mpd-automount-git
pkgver=r25.e92e399
pkgrel=1
pkgdesc="An udisks2-based automounter that links mountpoints to the MPD music directory"
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/muesli4/mpd-automount"
license=('MIT')
groups=()
depends=('udisks2' 'mpc')
makedepends=('git' 'make' 'gcc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
#backup=()
#options=()
source=("${pkgname%-git}::git://github.com/muesli4/mpd-automount.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	autoreconfi -vfi
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
