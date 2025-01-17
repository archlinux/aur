# Maintainer: Scott Panton <panton.scott@gmail.com>

pkgname=vban-git
pkgver=r97.4f69e5a
pkgrel=1
pkgdesc="An open-source implementation of a VBAN audio protocol receiver"
arch=('any')
url="https://github.com/quiniouben/vban"
depends=('alsa-lib' 'libpulse' 'jack')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/quiniouben/vban.git')
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
