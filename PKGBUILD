# Maintainer: Elvis Angelaccio <elvis.angelaccio@kde.org>

pkgname=hashcat-utils
pkgver=1.6
pkgrel=1
pkgdesc="A set of small utilities that are useful in advanced password cracking."
arch=('i686' 'x86_64')
url='https://github.com/hashcat/hashcat-utils'
license=('MIT')
depends=('perl')
makedepends=('binutils' 'make')
conflicts=('hashcat-utils-git')
source=("https://github.com/hashcat/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0867a5fae516a9e884b4c6bd4f30088e274c7de65b62a6e1f90236f8deac7ee3')

build() {
    cd "$srcdir/$pkgname-$pkgver"/src
    make
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
