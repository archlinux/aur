# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>

PROJECT=oxfuse
DESCR="High-level binding to libfuse3 for the D programming language"
DC=ldc2
DC_PKG=ldc
makedepends=("bash" "chrpath" "lsb-release" "fuse3" "pkgconf" "ldc")
depends=("fuse3" "ldc")
pkgver=0.1.1
pkgrel=0
license=("Boost or LGPL3")

pkgname=${PROJECT}-${DC}
pkgdesc="${DESCR}, version for ${DC^^}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=$pkgname-$pkgver.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v$pkgver.tar.gz")
sha256sums=("c010987a3869f6dafbfd469ed5bfa719f364db83a7d3f04607abf639c73233ed")

build() {
    cd "${PROJECT}-v$pkgver"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir install DC=${DC} || return 1
}
