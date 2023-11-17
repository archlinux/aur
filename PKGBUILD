# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libklvanc
pkgver=1.6.0
pkgrel=1
pkgdesc='Library for parsing/generation of Vertical Ancillary Data (VANC)'
arch=('x86_64')
url='https://github.com/stoth68000/libklvanc/'
license=('LGPL')
depends=('glibc')
source=("https://github.com/stoth68000/libklvanc/archive/vid.obe.${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5076ca48455a4ef4ead2cd880ba189b21937a9ad8fd458adfc133d7bb1c948c3')

prepare() {
    cd "${pkgname}-vid.obe.${pkgver}"
    ./autogen.sh --build
}

build() {
    cd "${pkgname}-vid.obe.${pkgver}"
    ./configure --prefix='/usr'
    make
}

package() {
    make -C "${pkgname}-vid.obe.${pkgver}" DESTDIR="$pkgdir" install
    
    # the -debug package is preventing binary executables from being stripped
    strip "$STRIP_BINARIES" "${pkgdir}/usr/bin"/*
} 
