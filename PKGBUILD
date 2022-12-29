# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_pkgname=nettle
pkgname=${_pkgname}7
pkgver=3.5.1
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
    'f738121b9091cbe79435fb5d46b45cf6f10912320c233829356908127bab1cac6946ca56e022a832380c44f2c10f21d2feef64cb0f4f41e3da4a681dc0131784'
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
