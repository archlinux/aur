# Maintainer: Justin Coffman <jcoffman@uid0.io>
# Contributor: Justin Coffman <jcoffman@uid0.io>

pkgname=tinyfugue
pkgver=5.0b8
pkgrel=7
arch=('i686' 'x86_64')
pkgdesc="a flexible, screen-oriented MUD client, for use with any type of MUD"
url="https://github.com/cipherize/tinyfugue"
license=('GPL3')

depends=(openssl pcre)

source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver-$pkgrel/$pkgname-$pkgver-$pkgrel.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/v$pkgver-$pkgrel/$pkgname-$pkgver-$pkgrel.tar.gz.asc")

b2sums=('91ebe1f81e0e9392c28d09108af3b95d1718bcdb2ed9143f3e1b322344ca2197f5607be27c232fde02baf43d7066222d57e08002da573a05ce03c3a80ab4bc03'
        'SKIP')

validpgpkeys=('28F768BE4B746F79A6D3288302FBEAF81EAD18C3')

build() {
    ./configure --prefix=/usr
    make
}

package() {
    mkdir "$pkgdir/usr"
    make prefix="$pkgdir/usr" -j1 install

    install -d "$pkgdir/usr/share/man/man1"
    install -m 644 src/tf.1.nroffman "$pkgdir/usr/share/man/man1/tf.1"
}
