# Maintainer: Jens Kuske <jenskuske@gmail.com>
pkgname=libcedrus-git
pkgver=85cbc02
pkgrel=1
pkgdesc="sunxi Video Engine library"
arch=('armv7h')
url="https://github.com/linux-sunxi/libcedrus"
license=('LGPL')
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/linux-sunxi/${pkgname%-git}")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long --always | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" prefix="/usr" install
}
