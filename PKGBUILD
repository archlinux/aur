# Maintainer: Rowan Decker <rowan@rowandecker.com>
pkgname=vban-git
pkgver=5c5d1118dcb99fb53f9c69b46794877b25d80d28
pkgrel=1
pkgdesc="An open-source implementation of a VBAN audio protocol receiver"
arch=('any')
url="https://github.com/quiniouben/vban"
depends=('alsa-lib' 'libpulse' 'jack')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git://github.com/quiniouben/vban.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
