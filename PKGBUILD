# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libklvanc-git
pkgver=1.6.0.r8.g3365db3
pkgrel=1
pkgdesc='Library for parsing/generation of Vertical Ancillary Data (VANC) (git version)'
arch=('x86_64')
url='https://github.com/stoth68000/libklvanc/'
license=('LGPL')
depends=('glibc')
makedepends=('git')
provides=('libklvanc')
conflicts=('libklvanc')
source=('git+https://github.com/stoth68000/libklvanc.git')
sha256sums=('SKIP')

prepare() {
    cd libklvanc
    ./autogen.sh --build
}

pkgver() {
    git -C libklvanc describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^vid\.obe\.//;s/^v//'
}

build() {
    cd libklvanc
    ./configure --prefix='/usr'
    make
}

package() {
    make -C libklvanc DESTDIR="$pkgdir" install
    
    # the -debug package is preventing binary executables from being stripped
    strip "$STRIP_BINARIES" "${pkgdir}/usr/bin"/*
} 
