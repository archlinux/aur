# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=vitis-fs
DESCR="Semantic file system"
makedepends=("bash" "chrpath" "findutils" "glib2" "amalthea-gdc" "oxfuse-gdc" "fuse3" "gcc-d")
depends=("ufo" "pageguard" "glib2" "amalthea-gdc" "oxfuse-gdc" "fuse3")
pkgver=0.31.0
pkgrel=0
license=("BSL-1.0 or GPL-3+")

DC=gdc
DC_PKG=gcc-d

pkgname=vitis
pkgdesc="${DESCR}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=$pkgname-$pkgver.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v$pkgver.tar.gz")
sha256sums=("112cd21f94721755368cc7f459f496fb9b98bf26fced4ac94fcb9760ed4b5052")

build() {
    cd "${PROJECT}-v$pkgver"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
