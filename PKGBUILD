# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=vitis
BASE_NAME=vitis
DESCR="Semantic file system"
makedepends=("bash" "chrpath" "findutils" "glib2" "amalthea-gdc" "oxfuse-gdc" "fuse3" "gcc-d")
depends=("ufo" "pageguard" "glib2" "amalthea-gdc" "oxfuse-gdc" "fuse3")
pkgver=0.31.1
pkgrel=0
license=("BSL-1.0 or GPL-3+")

DC=gdc
DC_PKG=gcc-d

pkgname=vitis-fs
pkgdesc="${DESCR}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=${BASE_NAME}-${pkgver}.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v${pkgver}.tar.gz")
sha256sums=("653a08089020ea49e0ac50e2fba425470af0ef210612db9923d058da1c6fe36e")

build() {
    cd "${PROJECT}-v${pkgver}"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v${pkgver}"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
