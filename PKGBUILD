# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>

PROJECT=oxfuse
DESCR="High-level binding to libfuse3 for the D programming language"
DC=dmd
DC_PKG=dmd
makedepends=("bash" "chrpath" "lsb-release" "fuse3" "pkgconf" "dmd")
depends=("fuse3" "dmd")
pkgver=0.1.0
pkgrel=0
license=("Boost or LGPL3")

pkgname=${PROJECT}-${DC}
pkgdesc="${DESCR}, version for ${DC^^}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=$pkgname-$pkgver.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v$pkgver.tar.gz")
sha256sums=("87e0fdb48bf8c19c7f95f36ebac02947bbb441f739cacf8345db1f031da05222")

build() {
    cd "${PROJECT}-v$pkgver"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir install DC=${DC} || return 1
}
