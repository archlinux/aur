# Maintainer: Justin Coffman <jcoffman@uid0.io>
# Contributor: Justin Coffman <jcoffman@uid0.io>

pkgname=tinyfugue
pkgver=5.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="a flexible, screen-oriented MUD client, for use with any type of MUD"
url="https://github.com/cipherize/tinyfugue"
license=('GPL3')

depends=('openssl' 'pcre')

source=("$pkgname-v$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver.tar.gz"
        "$pkgname-v$pkgver.tar.gz.asc::$url/releases/download/v$pkgver/$pkgname-v$pkgver.tar.gz.asc")

b2sums=('aa6882d97b69d31d509bc736ac2fa7dadce2548d886b5d05cf3792a9134265641dd5f9e4d2aacc7df8bbeaeeb3dca0f34a6f288e09a8a0e39cde158b83a5ad2a'
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
