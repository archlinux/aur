# Maintainer: Denilson Sá <denilsonsa@gmail.com>

pkgname=byteonpanel-git
pkgver=r5.09397fd
pkgrel=1
pkgdesc="Simple network traffic monitor in the systray"
arch=('x86_64')
url="https://github.com/whorfin/ByteOnPanel"
license=('GPL-3.0-or-later')
depends=('cairo' 'glib2' 'glibc' 'gtk3')
makedepends=('autoconf' 'automake' 'git' 'intltool' 'libtool' 'vala')
source=('git+https://github.com/whorfin/ByteOnPanel.git#branch=master')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/ByteOnPanel"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/ByteOnPanel"
	rm -f aclocal.m4
	libtoolize
	autoreconf
	./configure --prefix=/usr
	rm -f src/byteonpanel.c src/byteonpanel_vala.stamp
	make
}

package() {
	cd "$srcdir/ByteOnPanel"
	make DESTDIR="$pkgdir/" install
}
