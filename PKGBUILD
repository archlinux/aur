# Maintainer: Diego Cano <dcano@bleptstudio.es>
pkgname=moksha-git
pkgver=r16221.288d897d3
pkgrel=1
pkgdesc="A fork of the E17 window manager used by Bodhi Linux, git version."
arch=('i686' 'x86_64')
url="http://mokshadesktop.org"
license=('BSD')
depends=('desktop-file-utils' 'e_dbus' 'efl>1.18' 'xcb-util-keysyms')
makedepends=('git')
optdepends=('acpid: power events on laptop lid close'
            'bc: calculator in everything module'
            'connman: network module'
            'doxygen: build documentation'
            'evas_generic_loaders: provide support for SVG icons'
            'gdb: create backtraces on crash'
            'geoclue2: geolocation module')
provides=('moksha')
conflicts=("moksha" "enlightenment")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/JeffHoogland/${pkgname%-git}.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
