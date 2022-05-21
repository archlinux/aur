# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Victor Schulz <schulz89 at gmail dot com>
# Contributor: 2ion <dev at 2ion dot de>
# Contributor: TDY <tdy at archlinux dot info>
# Contributor: system <system at tou dot de>

pkgname=ebview-git
pkgver=r64.390e6ed
pkgrel=3
pkgdesc="A GTK2 based EPWING dictionary viewer."
arch=('i686' 'x86_64')
url="http://ebview.sourceforge.net"
license=('GPL')
depends=('gtk2' 'libeb' 'pango')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/fujii/ebview.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    ./autogen.sh
    ./configure \
	--prefix=/usr \
	--sysconfdir=/etc \
	CFLAGS="-D_FILE_OFFSET_BITS=64" \
	LIBS=-lX11
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
