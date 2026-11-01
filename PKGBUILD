# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=vitis
BASE_NAME=vitis
DESCR="Semantic file system"
makedepends=("bash" "chrpath" "findutils" "glib2" "amalthea-ldc2" "oxfuse-ldc2" "fuse3" "ldc")
depends=("ufo" "pageguard" "mediafragmenter" "glib2" "amalthea-ldc2" "oxfuse-ldc2" "fuse3")
pkgver=0.33.4
pkgrel=0
license=("BSL-1.0 or GPL-3+")

DC=ldc2
DC_PKG=ldc

pkgname=vitis-fs
pkgdesc="${DESCR}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=${BASE_NAME}-${pkgver}.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v${pkgver}.tar.gz")
sha256sums=("7dd8d3669eee803597a8188061b2ff447437b29e3398b6ef3425ff80d4d2821e")

build() {
    cd "${PROJECT}-v${pkgver}"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v${pkgver}"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
