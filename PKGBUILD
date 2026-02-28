# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=libdparse
DESCR="Library for lexing and parsing D source code"
makedepends=("bash" "chrpath" "findutils" "glib2" "ldc")
depends=("pkg-config" "ldc")
pkgver=0.25.1
pkgrel=1
license=("BSL-1.0")

DC=ldc2
DC_PKG=ldc

options=("staticlibs")

pkgname=${PROJECT}-${DC}
pkgdesc="${DESCR}, version for ${DC^^}"
arch=("x86_64")
url="https://github.com/dlang-community/libdparse"
TARBALL=v$pkgver.tar.gz
source=("$url/archive/$TARBALL" "add-makefile.patch" "add-make-helper.patch")
sha256sums=("83825fda4ce67cac49e1bfdce0051a9e2499a5fadbf3a7f4d0853b487eaebc82")

build() {
    cd "v$pkgver"
    patch -p1 < "${srcdir}/add-makefile.patch"
    patch -p1 < "${srcdir}/add-make-helper.patch"
    make DC=${DC} || return 1
}

package() {
    cd "v$pkgver"
    make DESTDIR=$pkgdir install DC=${DC} || return 1
}
