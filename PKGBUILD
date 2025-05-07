# Maintainer: Pierre Chapuis <arch@catwell.info>

# Note: prelink has not been maintained for years,
# but execstack can still be useful so I keep this package.

pkgname=execstack
pkgver=20130503
pkgrel=10
pkgdesc="set the executable stack flag of ELF binaries and libraries"
depends=(glibc libelf elfutils)
makedepends=(automake)
arch=("x86_64")
url="https://github.com/jwilk-mirrors/prelink"  # was: https://people.redhat.com/jakub/prelink
license=("GPL-2.0-only")
conflicts=(prelink)
source=("https://files.catwell.info/misc/mirror/software/prelink/prelink-$pkgver.tar.bz2")
sha256sums=("6339c7605e9b6f414d1be32530c9c8011f38820d36431c8a62e8674ca37140f0")

build () {
    cd prelink

    # fix libelf detection
    sed -i 's/#include <string.h>/&\n#include <unistd.h>/' m4/libelf.m4
    autoreconf -fi

    ./configure
    cd src
    make execstack
}

package () {
    cd prelink/src
    mkdir -p "$pkgdir/usr/bin"
    cp execstack "$pkgdir/usr/bin"
}
