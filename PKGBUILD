# Maintainer: Connor Sheridan <connorws@protonmail.com>
# Contributor: Connor Sheridan <connorws@protonmail.com>

pkgname=tinyfugue
pkgver=5.0
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc="a flexible, screen-oriented MUD client, for use with any type of MUD"
url="https://github.com/tinyfugue/tinyfugue"
license=('GPL3')

depends=('openssl' 'pcre')

source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")

b2sums=('64f6c634a9acdeabb81a3218e81809813db16956c05e734dbf5688a7ce97ba02f65dd50c36b875b1f8c0fd10cccd98292ad5988c76d457d883c04bb52ff168d2')

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
