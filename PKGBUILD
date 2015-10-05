# Maintainer: alzeih <alzeih@users.noreply.github.com>
pkgname=vncterm-git
pkgver=r40.254342f
pkgrel=1
pkgdesc="Export virtual console sessions to any VNC client"
arch=('i386' 'x86_64')
url="https://github.com/LibVNC/vncterm"
license=('GPL')
makedepends=('xorg-util-macros')
depends=('libvncserver')
source=('vncterm-git::git+https://github.com/LibVNC/vncterm')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname}"
	libtoolize --force
	aclocal
	autoheader || true
	automake --force-missing --add-missing
	autoconf
}

build() {
	cd "$srcdir/${pkgname}"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname}"
	make DESTDIR="$pkgdir/" install
}
