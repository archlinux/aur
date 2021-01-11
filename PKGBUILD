# Maintainer: Justin Coffman <jcoffman@foxide.io>
# Contributor: Justin Coffman <jcoffman@foxide.io>

pkgname=tinyfugue
pkgver=5.0
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc="a flexible, screen-oriented MUD client, for use with any type of MUD"
url="https://github.com/tinyfugue/tinyfugue"
license=('GPL3')

depends=('openssl' 'pcre')

source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")

b2sums=('e701989c3e1df192c44047995907d27bc6c3286a98bafbb8c803126b973fc4b8fd105c2d1efb211ca7b2f9656f460db4f67d8654e78c0e1693348803cca2e699')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    mkdir "$pkgdir/usr"
    make prefix="$pkgdir/usr" -j1 install

    install -d "$pkgdir/usr/share/man/man1"
    install -m 644 src/tf.1.nroffman "$pkgdir/usr/share/man/man1/tf.1"
}
