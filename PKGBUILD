# Maintainer: Peter Lamby <peterlamby@web.de>
pkgname=lib50-c
pkgver=6
pkgrel=1
pkgdesc="CS50 / CS50x Library for C (Harvard College's Introduction to Computer Science I)"
arch=('i686' 'x86_64')
url="https://github.com/cs50/library50-c"
license=('BSD')
depends=('glibc')
source=(http://mirror.cs50.net/library50/c/library50-c-$pkgver.zip)
md5sums=('46c6c962f678cb43797030270a4bae18')
install='lib50-c.install'

build() {
    cd "$srcdir/$pkgname-$pkgver"
    gcc -c -ggdb -std=c99 -fPIC cs50.c -o cs50.o
    gcc -shared -o libcs50.so cs50.o
}

package() {
    install -dm755 "$pkgdir/"{usr/include,usr/lib}
    install -Dm644 "$srcdir/library50-c-6/libcs50.so" "$pkgdir/usr/lib"
    install -Dm644 "$srcdir/library50-c-6/cs50.h" "$pkgdir/usr/include"
}
