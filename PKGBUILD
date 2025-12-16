# Maintainer: Luca Kredel <luca dot kredel at web dot de>
pkgname=yoctofetch-git
pkgver=v1.2.0.r1.b3fc699
pkgrel=1
pkgdesc="Fast(est) system fetch tool for Linux with a low footprint"
arch=(x86_64)
url="https://codeberg.org/Phosphenius/yoctofetch"
license=('GPL-3.0-or-later')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}

