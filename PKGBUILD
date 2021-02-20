# Maintainer: Justin Coffman <jcoffman@sysguard.io>
# Contributor: Justin Coffman <jcoffman@sysguard.io>

pkgname=tinyfugue
pkgver=5.0
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc="a flexible, screen-oriented MUD client, for use with any type of MUD"
url="https://github.com/tinyfugue/tinyfugue"
license=('GPL3')

depends=('openssl' 'pcre')

source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")

b2sums=('27680856566985581afde890cb5b157bfddc4464313e60957ad2c6f2880ba2e5788bd5044c2e893a71d32b142cbb723c1002c8ce6880660157cef6ac5484b917')

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
