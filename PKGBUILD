# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=ufo
BASE_NAME=ufo
DESCR="A tool for opening files"
makedepends=("bash" "chrpath" "findutils" "glib2" "amalthea-gdc" "gcc-d")
depends=("glib2" "amalthea-gdc")
pkgver=0.9.0
pkgrel=0
license=("BSL-1.0 or GPL-3+")

DC=gdc
DC_PKG=gcc-d

pkgname=ufo
pkgdesc="${DESCR}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=${BASE_NAME}-${pkgver}.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v${pkgver}.tar.gz")
sha256sums=("bbbe2ee3b09a188cbf6094cb5371e7af561dbdf8451e9056403f54448ebb580a")

build() {
    cd "${PROJECT}-v${pkgver}"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v${pkgver}"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
