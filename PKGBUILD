# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=mosml
pkgver=2.10.1
pkgrel=1
pkgdesc='Moscow ML is a light-weight implementation of Standard ML (SML)'
url="http://mosml.org"
license=('GPL')
arch=('i686' 'x86_64')
source=("https://github.com/kfl/mosml/archive/ver-$pkgver.tar.gz")
md5sums=('40426700791760ec25aaecc06dcfc2d9')

build() {
    cd mosml-ver-$pkgver/src
    make PREFIX=/usr world
}

package() {
    cd mosml-ver-$pkgver/src
    make PREFIX=/usr DESTDIR="$pkgdir" install

    # This isn't done by the Makefile
    cd ../man
    for manual in *.1; do
        install -Dm644 "$manual" "$pkgdir/usr/share/man/man1/$manual"
    done
}
