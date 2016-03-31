# Maintainer: minus <minus@mnus.de>
pkgname=nav-git
pkgver=r489.7983ab2
pkgrel=1
pkgdesc="nav is a hackable ncurses file manager, inspired by vim, ranger, and dvtm."
arch=("i686" "x86_64")
url="https://github.com/jollywho/nav"
license=('MIT')
depends=('ncurses' 'libtermkey' 'libuv')
optdepends=('w3m: image support')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/nav/navrc')
source=("${pkgname%-*}::git+https://github.com/jollywho/nav.git")
sha1sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"

	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
