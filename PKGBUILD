# Maintainer: Justin Coffman <jcoffman@cipherize.net>
# Contributor: Justin Coffman <jcoffman@cipherize.net>

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

b2sums=('668e4ce90c7629bf05366260e3a7f16c336bc524fc9d4505a304bad6949a4e05df21e877d5ff1d3c6032cddaf18139cd7bc2abd59aaeb9502d17c106c75b2a1f'
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
