# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=vitis-fs
DESCR="Semantic file system"
makedepends=("bash" "chrpath" "findutils" "glib2" "amalthea-ldc2" "oxfuse-ldc2" "ldc")
depends=("glib2" "amalthea-ldc2" "oxfuse-ldc2")
pkgver=0.29.0
pkgrel=0
license=("BSL-1.0 or GPL-3+")

DC=ldc2
DC_PKG=ldc

pkgname=${PROJECT}
pkgdesc="${DESCR}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=$pkgname-$pkgver.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v$pkgver.tar.gz")
sha256sums=("3a7ca90d0b889c5e0d789980bce7406c3d1707970e7a4a80614e0e5b749ccd0f")

build() {
    cd "${PROJECT}-v$pkgver"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
