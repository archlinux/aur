# Maintainer: Andrew Querol <andrew@querol.me>

pkgname=chrome-gnome-shell-git
pkgver=5.1_118.ad397d6
pkgrel=1
pkgdesc="Native connector for extensions.gnome.org using chrome-gnome-shell"
arch=('any')
url="https://git.gnome.org/browse/chrome-gnome-shell"
license=('GPL')
depends=('gnome-shell' 'python2')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
replaces=('gs-chrome-connector') # Old name, renamed at request of the maintainer
conflicts=($replaces)
source=("${pkgname%-git}::git+https://git.gnome.org/browse/chrome-gnome-shell")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s_%s.%s" "${pkgver%_*}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p 'build'
}

build() {
	cd "$srcdir/${pkgname%-git}/build"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_EXTENSION=OFF ../
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	make DESTDIR="$pkgdir/" install
}
