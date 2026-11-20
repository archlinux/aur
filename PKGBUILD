# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=vitis
BASE_NAME=vitis
DESCR="Semantic file system"
makedepends=("bash" "chrpath" "findutils" "glib2" "amalthea-ldc2" "oxfuse-ldc2" "fuse3" "ldc")
depends=("ufo" "pageguard" "mediafragmenter" "glib2" "amalthea-ldc2" "oxfuse-ldc2" "fuse3")
pkgver=0.33.6
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
sha256sums=("9e6b9c0292243c862498c58e014dbbe1f330a845a2214b064bb0ac6b7b629e4e")

build() {
    cd "${PROJECT}-v${pkgver}"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v${pkgver}"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
