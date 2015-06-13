# $Id: PKGBUILD 9174 2008-08-17 04:41:36Z allan $
# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: dale <dale@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=fortunelock
pkgver=0.1.2
pkgrel=3
pkgdesc="A simple, program to lock a terminal while showing fortunes."
arch=('i686' 'x86_64')
url="http://www.freshports.org/sysutils/fortunelock/"
_watch="ftp://ftp.freebsd.org/pub/FreeBSD/ports/local-distfiles/dannyboy/"
license=('GPL2')
depends=('fortune-mod' 'ncurses' 'glibc')
source=(ftp://ftp.freebsd.org/pub/FreeBSD/ports/local-distfiles/dannyboy/${pkgname}-${pkgver}.tar.bz2)
md5sums=('3df38afc59800db77e7cf77b0239a480')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i 's/timeout.tv_sec = 3/timeout.tv_sec = 10/' fortunelock.c
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/man/man1"
    sed -i "s|/man/|/share/man/|" Makefile
    make PREFIXDIR="$pkgdir/usr" install
}
