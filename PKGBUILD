# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=protobuf25
pkgver=2.5.0
pkgrel=1
pkgdesc="Protocol Buffers"
arch=('x86_64')
url='https://github.com/google/protobuf/'
license=('BSD')
depends=('gcc-libs' 'zlib')
makedepends=('autoconf' 'automake' 'libtool')
provides=('protobuf')
conflicts=('protobuf')
source=("https://github.com/protocolbuffers/protobuf/archive/v$pkgver.tar.gz"
        "gtest.diff")
sha512sums=('0128d810b5517fbb801b263146ccc673516c7dfe665e33da35ce81f1589b35d15c7c4440d22a2151533dcb88e19a1ea1749f6a7d0a91e8484943c2ae0c7bdb24'
            'eafa8296c6a66dcd411196937d0a240f04f97d79a9c529bcb07142f1a86b98bc098430f7fac6994d4b532a70cffe5b1989b15a62dc344e3d68d00f5c3a3c9321')

prepare() {
    cd protobuf-$pkgver
    patch -p1 < ../gtest.diff
}

build() {
    cd protobuf-$pkgver
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

check() {
    cd protobuf-$pkgver
    make check
}

package() {
    cd protobuf-$pkgver
    make DESTDIR="$pkgdir" install
    install -Dm644 COPYING.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim: set ts=4 sw=4 et :
