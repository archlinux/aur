# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Xemertix <arch88@katamail.com>

pkgname=paq8o
pkgver=9
pkgrel=1
pkgdesc="PAQ8 series of archivers, resurrected by new maintainers"
arch=(i686 x86_64)
url=http://cs.fit.edu/~mmahoney/compression
license=(unknown)
makedepends=(yasm)
source=($url/$pkgname$pkgver.zip)
sha256sums=('53eafa4797d72b6d5630cfa9b43e69b3de58f01119bdf8f23b6d3d940a9d2336')
sha512sums=('e63e5ce34094dfd9dac62e3754d79be6a605165526bee953f39270932884dd20eaf5cd3d1e7c6c3b9984ab6f32b92b72ccf066abfbd90e8e747903276f186851')

build() {
    if [[ $CARCH == "i686" ]]; then
        yasm paq7asmsse.asm -f elf -m x86 && g++ $CFLAGS -DUNIX $pkgname$pkgver.cpp paq7asmsse.o -o $pkgname
    else
        yasm paq7asm-x86_64.asm -f elf -m amd64 && g++ $CFLAGS -DUNIX $pkgname$pkgver.cpp paq7asm-x86_64.o -o $pkgname
    fi
}

package() {
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
