# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=amalthea
DESCR="Small general-purpose library for the D programming language"
makedepends=("bash" "chrpath" "findutils" "glib2" "gcc-d")
depends=("dialog" "pkg-config" "glib2" "gcc-d")
pkgver=1.15.0
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
sha256sums=("c4bad1979c8f7d6f9a9748eee2b780ce1aa4f8c0e34d4e080831bcc15f71fc91")

build() {
    cd "${PROJECT}-v$pkgver"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
