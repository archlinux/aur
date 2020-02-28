# Maintainer: Jerry Xiao <aur at mail.jerryxiao.cc>
# Contributor: Tod Jackson <tod.jackson@gmail.com>

_pkgname=stockfish
pkgname=stockfish-aarch64
pkgver=11
pkgrel=1
pkgdesc="A strong chess engine written by Tord Romstad, Marco Costalba, Joona Kiiski"
arch=('aarch64')
url="https://stockfishchess.org/"
license=('GPL3')
depends=('glibc')
source=("aarch64.patch"
        "https://stockfishchess.org/files/$_pkgname-$pkgver-linux.zip")
sha256sums=('fb501f68a71453ca8a2bda0867552a31ddb2bf22b2cd096e086afda7bca1238f'
            '96712b8c1d3eb8acd542eb7aecd8594a0c07f71ed4aca3a9d82fef84534ca576')

prepare() {
    cd "$_pkgname-$pkgver-linux/src"
    patch -p0 Makefile < "${srcdir}/aarch64.patch"
}
build() {
    cd "$_pkgname-$pkgver-linux/src"
    export CFLAGS="$CFLAGS -fstack-protector -fplt"
    export CXXFLAGS="$CXXFLAGS -fstack-protector -fplt"
    make build ARCH=aarch64 COMP=gcc
}

package() {
    cd "$_pkgname-$pkgver-linux/src"
    make PREFIX="$pkgdir/usr" install
}
