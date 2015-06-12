# Maintainer: Michael Hansen <zrax0111 gmail com>

_pkgname=libbuddy
pkgname=$_pkgname-git
pkgver=0.3.1.8.g75f323f
pkgrel=1
pkgdesc="Simple library for managing iBuddy and Blync devices"
arch=("i686" "x86_64" "armv6h" "armv7h")
url="https://github.com/zrax/libbuddy"
license=("GPL2")
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=("libusb")
makedepends=("git")
source=("git://github.com/zrax/$_pkgname.git")
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --tags | sed 's/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    /bin/bash autogen.bash

    mkdir -p "$srcdir/build"
    cd "$srcdir/build"
    "$srcdir/$_pkgname/configure" --prefix=/usr
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir" install
}
