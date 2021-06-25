# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=pixbufloader-vtf-git
pkgver=r9.2a5a1e7
pkgrel=1
pkgdesc="Load Valve Texture Files in Gtk+ applications"
arch=('x86_64')
url="https://github.com/HurricanePootis/pixbufloader-vtf"
license=('GPL')
depends=('libvtflib-git' 'gdk-pixbuf2')
makedepends=('cmake' 'libvtflib-git' 'git' 'gdk-pixbuf2')
source=("git+https://github.com/HurricanePootis/pixbufloader-vtf")
md5sums=('SKIP')


pkgver() {
 cd "$srcdir/pixbufloader-vtf"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/pixbufloader-vtf"
	mkdir "./build"
	cd "./build" || exit
	cmake ../ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr"
	make
}

package() {
	cd "$srcdir/pixbufloader-vtf/build"
	make install DESTDIR="$pkgdir"
}
