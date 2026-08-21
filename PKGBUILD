# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=amalthea
BASE_NAME=amalthea-ldc2
DESCR="Small general-purpose library for the D programming language"
makedepends=("bash" "chrpath" "findutils" "glib2" "ldc")
depends=("dialog" "pkg-config" "glib2" "ldc")
pkgver=1.21.1
pkgrel=1
license=("BSL-1.0 or LGPL-3+")

DC=ldc2
DC_PKG=ldc

options=("staticlibs")

pkgname=${PROJECT}-${DC}
pkgdesc="${DESCR}, version for ${DC^^}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=${BASE_NAME}-${pkgver}.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v${pkgver}.tar.gz")
sha256sums=("bd3faa4522b7a641c710b476a4c264e5be8e7b1ab58c57e3ca849dab2536f852")

build() {
    cd "${PROJECT}-v${pkgver}"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v${pkgver}"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
