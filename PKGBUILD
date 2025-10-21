# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=oxfuse
DESCR="High-level binding to libfuse3 for the D programming language"
makedepends=("bash" "chrpath" "findutils" "pkg-config" "fuse3" "dmd")
depends=("fuse3" "dmd")
pkgver=0.5.1
pkgrel=0
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
sha256sums=("3d3bdde092da02c770b862ccc360da0c00568a0286d162cab2980d96f2840f2b")

build() {
    cd "${PROJECT}-v$pkgver"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
