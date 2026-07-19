# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=amalthea
DESCR="Small general-purpose library for the D programming language"
makedepends=("bash" "chrpath" "findutils" "glib2" "gcc-d")
depends=("dialog" "pkg-config" "glib2" "gcc-d")
pkgver=1.19.1
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
sha256sums=("7ad9b8372b77102738480876c5f9fe1570a5aaecb51fb37af6d9562b3bb788af")

build() {
    cd "${PROJECT}-v$pkgver"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
