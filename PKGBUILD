# Maintainer: Justin Coffman <jcoffman@uid0.io>
# Contributor: Justin Coffman <jcoffman@uid0.io>

pkgname=tinyfugue
pkgver=5.0b8
pkgrel=7
arch=('i686' 'x86_64')
pkgdesc="a flexible, screen-oriented MUD client, for use with any type of MUD"
url="http://tinyfugue.sourceforge.net/"
license=('GPL3')

depends=(openssl pcre)

source=("$pkgname-$pkgver.tar.gz::https://github.com/cipherize/tinyfugue/releases/download/v$pkgver-$pkgrel/tf-$pkgver-$pkgrel.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://github.com/cipherize/tinyfugue/releases/download/v$pkgver-$pkgrel/tf-$pkgver-$pkgrel.tar.gz.asc")

b2sums=('01c4a9e63368d197d3251adf751e705ae6dd0fdb098524337f2e48256fb0e6ca46b35b7cb932b0b11ca887f5690f65f1c1cae0f81523bcee60652f354c22bd18'
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
