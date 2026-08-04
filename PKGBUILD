# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=amalthea
BASE_NAME=amalthea-dmd
DESCR="Small general-purpose library for the D programming language"
makedepends=("bash" "chrpath" "findutils" "glib2" "dmd")
depends=("dialog" "pkg-config" "glib2" "dmd")
pkgver=1.20.0
pkgrel=1
license=("BSL-1.0 or LGPL-3+")

DC=dmd
DC_PKG=dmd

options=("staticlibs")

pkgname=${PROJECT}-${DC}
pkgdesc="${DESCR}, version for ${DC^^}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=${BASE_NAME}-${pkgver}.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v${pkgver}.tar.gz")
sha256sums=("d1da060cdd084f9f295ae529caa42ba3f99525cf5d8fc3a89c3c20c83b509068")

build() {
    cd "${PROJECT}-v${pkgver}"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v${pkgver}"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
