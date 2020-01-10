# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=elementary-planner-git
pkgver=r276.d16c537
pkgrel=1
pkgdesc="Personal task manager designed for elementary OS"
arch=('x86_64')
url="https://planner-todo.web.app"
license=('GPL3')
depends=('gtk3' 'libsoup' 'granite' 'webkit2gtk' 'evolution-data-server'
         'gtk-theme-elementary' 'elementary-icon-theme')
makedepends=('git' 'meson' 'vala' 'cmake' 'appstream')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/alainm23/planner.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/planner"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/planner"
	arch-meson build
	ninja -C build
}

package() {
	cd "$srcdir/planner"
	DESTDIR="$pkgdir" ninja -C build install

	ln -s /usr/bin/com.github.alainm23.planner "$pkgdir/usr/bin/planner"
}
