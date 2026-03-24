# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=amalthea
DESCR="Small general-purpose library for the D programming language"
makedepends=("bash" "chrpath" "findutils" "glib2" "ldc")
depends=("dialog" "pkg-config" "glib2" "ldc")
pkgver=1.14.3
pkgrel=1
license=("BSL-1.0 or LGPL-3+")

DC=ldc2
DC_PKG=ldc

options=("staticlibs")

pkgname=${PROJECT}-${DC}
pkgdesc="${DESCR}, version for ${DC^^}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=$pkgname-$pkgver.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v$pkgver.tar.gz")
sha256sums=("2df539333ac79b43e7deaba49101f41623f78a94de802e4a0e7d7443b249bf02")

build() {
    cd "${PROJECT}-v$pkgver"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
