# Maintainer: Andrew Querol <andrew@querol.me>

pkgname=gs-chrome-connector-git
pkgver=5.1_115.bc10252
pkgrel=2
pkgdesc="Native connector for extensions.gnome.org using chrome-gnome-shell"
arch=('any')
url="https://github.com/nE0sIghT/chrome-gnome-shell"
license=('GPL')
depends=('gnome-shell' 'python2')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/nE0sIghT/chrome-gnome-shell")
md5sums=('SKIP')
install=gs-chrome-connector.install

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
