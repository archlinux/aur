# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=oxfuse
DESCR="High-level binding to libfuse3 for the D programming language"
makedepends=("bash" "chrpath" "findutils" "pkg-config" "fuse3" "gcc-d")
depends=("fuse3" "gcc-d")
pkgver=0.4.2
pkgrel=0
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
sha256sums=("a07e0cf8ebcc3d2d2f2e54bba3e2990e87ec406b300a5cbb7125b5a784a6a2dd")

build() {
    cd "${PROJECT}-v$pkgver"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir install DC=${DC} || return 1
}
