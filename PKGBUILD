# Maintainer: Michael Wawrzyniak <arch ismyusernameat cmstactical nexttothecomma net>
# Contributor: chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=syncterm
pkgver=1.1
pkgrel=4
pkgdesc="A BBS terminal program, supporting ANSI music and IBM charset."
url="http://syncterm.bbsdev.net"
license=('GPL')
depends=('ncurses')
makedepends=('unzip')
optdepends=('hicolor-icon-theme: for GUI icon support'
            'sdl2: for SDL GUI support'
            'libx11: for X11 GUI support')
arch=('i686' 'x86_64')
source=("https://downloads.sourceforge.net/project/syncterm/syncterm/$pkgname-$pkgver/$pkgname-$pkgver-src.tgz"
        "cl-linux-yield.patch"
        "cl-makefile.patch"
        "st_crypt.patch")
md5sums=('f528a1fdbe87a69a52582582d99e4032'
         'c67ca676bddbbbbefa3fe20cd00ab7e7'
         '3471ec7748fc0a9d8be12424be7a8ff5'
         '69f59c1a5f71e44beb6e68644d497418')

prepare() {
	cp "$srcdir/cl-linux-yield.patch" "$pkgname-$pkgver/3rdp/build/cl-linux-yield.patch"
	patch -Np1 -d "$pkgname-$pkgver" -i "${srcdir}/cl-makefile.patch"
	patch -Np1 -d "$pkgname-$pkgver" -i "${srcdir}/st_crypt.patch"
}

build() {
	cd "$pkgname-$pkgver/src/syncterm"
	make PREFIX="/usr" MANPREFIX="/usr/share" RELEASE=1
}

package() {
	cd "$pkgname-$pkgver/src/syncterm"
	make PREFIX="$pkgdir/usr" MANPREFIX="$pkgdir/usr/share" RELEASE=1 install
}
