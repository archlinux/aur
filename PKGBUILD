# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_pkgname=nettle
pkgname=${_pkgname}7
pkgver=3.10.1
pkgrel=1
pkgdesc='A low-level cryptographic library (legacy version)'
arch=('x86_64')
url='https://www.lysator.liu.se/~nisse/nettle'
license=('GPL2')
depends=('gmp')
provides=('libnettle.so.7' 'libhogweed.so.5')
checkdepends=('valgrind')
source=(https://ftp.gnu.org/gnu/$_pkgname/$_pkgname-$pkgver.tar.gz{,.sig})
sha512sums=(
    'e8673bbcde9cde859ccae75ed6c9c30591e68a995a7c6d724106cfd67a5a5bd45b3468d742443b6565628849d0fd29505a28ca5ee4e89dd13197cdb51429f96c'
    'SKIP'
)
validpgpkeys=('343C2FF0FBEE5EC2EDBEF399F3599FF828C67298') # Niels Möller <nisse@lysator.liu.se>

build() {
    cd $_pkgname-$pkgver
    ./configure --prefix=/usr \
        --disable-static
    make
}

check() {
    cd $_pkgname-$pkgver
    make -k check
}

package() {
    cd $_pkgname-$pkgver
    make DESTDIR="$pkgdir/" install
    rm -rf "$pkgdir/usr/"{bin,include,share,lib/{pkgconfig,libhogweed.so,libnettle.so}}
}
