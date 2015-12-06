# Maintainer: Elvis Angelaccio <elvis.angelaccio@kdemail.net>

pkgname=hashcat-utils
pkgver=1.2
pkgrel=1
pkgdesc="A set of small utilities that are useful in advanced password cracking."
arch=('i686' 'x86_64')
url='https://github.com/hashcat/hashcat-utils'
license=('MIT')
depends=('perl')
makedepends=('binutils' 'make')
conflicts=('hashcat-utils-git')
source=("https://codeload.github.com/hashcat/$pkgname/tar.gz/$pkgver")
sha256sums=('2bf50b21ea72d087aa5795874ce1ca8c9e70f2ca429652a07bb6f90c088727f3')

build() {
    cd "$srcdir/$pkgname-$pkgver"/src
    make linux
    strip *.bin
}

package() {
    cd "$srcdir/$pkgname-$pkgver"/src

    install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    for bin in *.bin; do
        install -Dm755 $bin "$pkgdir/usr/bin/$(basename $bin .bin)"
    done

    for script in *.pl; do
        install -Dm755 $script "$pkgdir/usr/bin/"
    done
}