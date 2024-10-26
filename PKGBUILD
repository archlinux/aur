# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=amalthea
DESCR="Small general library for the D programming language"
makedepends=("bash" "chrpath" "findutils" "glib2" "dmd")
depends=("dialog" "glib2" "dmd")
pkgver=1.8.0
pkgrel=1
license=("BSL-1.0 or LGPL-3+")

DC=dmd
DC_PKG=dmd

options=("staticlibs")

pkgname=${PROJECT}-${DC}
pkgdesc="${DESCR}, version for ${DC^^}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=$pkgname-$pkgver.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v$pkgver.tar.gz")
sha256sums=("6a8ca474ba8323b00c564df4aaa955a541a9aac63c567d5404ed803f263a3120")

build() {
    cd "${PROJECT}-v$pkgver"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir install DC=${DC} || return 1
}
