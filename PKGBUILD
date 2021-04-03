# Maintainer: Connor Sheridan <cws@nullsec.sh>
# Contributor: Connor Sheridan <cws@nullsec.sh>

pkgname=tinyfugue
pkgver=5.0.1
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc="a flexible, screen-oriented MUD client, for use with any type of MUD"
url="https://github.com/tinyfugue/tinyfugue"
license=('GPL3')

depends=('openssl' 'pcre')

source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")

b2sums=('9a6d367e883103ef308d02bf4ffc26f277ea9051bac6f60e461892d8871175b19a35bded4fa6a65857741df3f1aabb3bb7b774338833a59286d3a43d854f0780')

build() {
    cd "$pkgname-$pkgver"
    ./configure \
        --prefix=/usr \
        --enable-core \
        --enable-inet6 \
        --enable-ssl \
        --enable-atcp \
        --enable-gmcp \
        --enable-option102
    make
}

package() {
    cd "$pkgname-$pkgver"
    mkdir "$pkgdir/usr"
    make prefix="$pkgdir/usr" -j1 install

    install -D -p -m 644 src/tf.1.nroffman "$pkgdir/usr/share/man/man1/tf.1"
}
