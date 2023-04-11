# Maintainer: Denilson Sá <denilsonsa@gmail.com>

pkgname=byteonpanel-git
pkgver=r3.cc2fa40
pkgrel=1
pkgdesc="Simple network traffic monitor in the systray"
arch=('x86_64')
url="https://github.com/whorfin/ByteOnPanel"
license=('GPL3')
depends=('cairo' 'gtk3' 'vala')
makedepends=('git' 'libtool' 'automake' 'autoconf')
source=('git+https://github.com/whorfin/ByteOnPanel.git#branch=master')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/ByteOnPanel"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/ByteOnPanel"
	rm aclocal.m4
	libtoolize
	autoreconf
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/ByteOnPanel"
	make DESTDIR="$pkgdir/" install
}
