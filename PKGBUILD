# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=amalthea
DESCR="Small general library for the D programming language"
makedepends=("bash" "chrpath" "glib2" "gcc-d")
depends=("glib2" "gcc-d")
pkgver=1.5.0
pkgrel=1
license=("BSL-1.0 or LGPL-3+")

DC=gdc
DC_PKG=gcc-d

pkgname=${PROJECT}-${DC}
pkgdesc="${DESCR}, version for ${DC^^}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=$pkgname-$pkgver.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v$pkgver.tar.gz")
sha256sums=("08461529dfd1df16049a2af928d188e331c2841b0ed6abea9f01729adba7ba71")

build() {
    cd "${PROJECT}-v$pkgver"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir install DC=${DC} || return 1
}
