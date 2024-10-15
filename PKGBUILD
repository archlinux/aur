# Maintainer: Pablo Alessandro Santos Hugen <PabloASHugen@protonmail.com>
pkgname=sandbar-git
pkgver=v0.1.r13.aa3f203
pkgrel=1
pkgdesc="dwm-like bar for the river wayland compositor"
arch=(x86_64)
url="https://github.com/kolunmi/sandbar"
license=('GPL3')
depends=('wayland' 'pixman' 'fcft' 'tllist')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("sandbar::git+https://github.com/kolunmi/sandbar.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s-%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
