# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=oxfuse
DESCR="High-level binding to libfuse3 for the D programming language"
makedepends=("bash" "chrpath" "findutils" "fuse3" "ldc")
depends=("fuse3" "ldc")
pkgver=0.2.1
pkgrel=0
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
sha256sums=("2e201a451f9c643651311be4f45613240c3f188d361f015ea89e6e9d1777c84a")

build() {
    cd "${PROJECT}-v$pkgver"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir install DC=${DC} || return 1
}
