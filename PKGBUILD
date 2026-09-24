# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=htmldnext
BASE_NAME=htmldnext-ldc2
DESCR="A lightweight HTML parser with zero dependencies"
makedepends=("bash" "pkg-config" "ldc")
depends=("ldc")
pkgver=0.4.1
pkgrel=0
license=("MIT")

DC=ldc2
DC_PKG=ldc

options=("staticlibs")

pkgname=${PROJECT}-${DC}
pkgdesc="${DESCR}, version for ${DC^^}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=${BASE_NAME}-${pkgver}.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v${pkgver}.tar.gz")
sha256sums=("d4a764b9b029c2968ed5318606f25e3a43d71c005efdd75df4ec37185742e382")

build() {
    cd "${PROJECT}-v${pkgver}"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v${pkgver}"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
