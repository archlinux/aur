# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=fastplong
pkgver=0.7.1
pkgrel=1
pkgdesc="Ultra-fast preprocessing and quality control for long-read sequencing data"
arch=('x86_64')
url="https://github.com/OpenGene/fastplong"
license=('MIT')
options=('!strip' '!debug')
depends=('glibc' 'zlib' 'highway' 'isa-l' 'libdeflate')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('29cd6545d0db00e4a53989088dcdb7b0f0dcbc4442574fb1b5f67b594df7cb5b')

build() {
    cd "$srcdir/fastplong-$pkgver"
    # The bundled Makefile links isa-l/libdeflate/highway from Homebrew paths;
    # override with system library/header dirs for a dynamic link.
    make INCLUDE_DIRS=/usr/include LIBRARY_DIRS=/usr/lib
}

check() {
    cd "$srcdir/fastplong-$pkgver"
    ./fastplong --version | grep -q fastplong
}

package() {
    cd "$srcdir/fastplong-$pkgver"
    install -Dm755 fastplong "$pkgdir/usr/bin/fastplong"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
