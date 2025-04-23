# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=amalthea
DESCR="Small general library for the D programming language"
makedepends=("bash" "chrpath" "findutils" "glib2" "gcc-d")
depends=("dialog" "glib2" "gcc-d")
pkgver=1.10.1
pkgrel=1
license=("BSL-1.0 or LGPL-3+")

DC=gdc
DC_PKG=gcc-d

options=("staticlibs")

pkgname=${PROJECT}-${DC}
pkgdesc="${DESCR}, version for ${DC^^}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=$pkgname-$pkgver.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v$pkgver.tar.gz")
sha256sums=("280aa210e1d8c5ca9f92b7eeb53d0a31d5e82e68b13de99317da5643ccd4ce21")

build() {
    cd "${PROJECT}-v$pkgver"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
