# Maintainer: Peter Dean <pjd2503 at gmail dot com>
pkgname='crypt'
pkgver='r12.1b95a9d'
pkgrel=1
pkgdesc="A public-domain replacement for the UNIX \"crypt\" command"
arch=('x86_64')
url="https://github.com/freebsd/freebsd/tree/master/usr.bin/enigma"
license=('unknown')
source=("https://raw.githubusercontent.com/freebsd/freebsd/master/usr.bin/enigma/enigma.1" 
        "https://raw.githubusercontent.com/freebsd/freebsd/master/usr.bin/enigma/enigma.c")

prepare() {
	cd $srcdir 
        sed -i '/FBSDID/d;45,48d;s/strlcpy/strncpy/;/<unistd.h>/a\
#include <crypt.h>' enigma.c
}

build() {
	cd $srcdir 
        gcc enigma.c -o crypt -lcrypt
}

package() {
	cd $srcdir
        install -Dm 755 ./crypt $pkgdir/usr/bin/crypt
        install -Dm 644 ./enigma.1 $pkgdir/usr/share/man/man1/crypt.1
        install -Dm 644 ./enigma.1 $pkgdir/usr/share/man/man1/enigma.1
}
md5sums=('d4e4f1de06369065d2b99625d9a5e438'
         'acc3c6c9e8b7d1f24f19e53c7495b33e')
