# Maintainer: Elvis Angelaccio <elvis.angelaccio@kde.org>

pkgname=hashcat-utils
pkgver=1.7
pkgrel=1
pkgdesc="A set of small utilities that are useful in advanced password cracking."
arch=('i686' 'x86_64')
url='https://github.com/hashcat/hashcat-utils'
license=('MIT')
depends=('perl')
makedepends=('binutils' 'make')
conflicts=('hashcat-utils-git')
source=("https://github.com/hashcat/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e5369011f4489ff861c1a2a445f3c35efdb95e425398b60798cafcf75a39452e')

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
