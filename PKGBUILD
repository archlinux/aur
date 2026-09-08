# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=ufo
BASE_NAME=ufo
DESCR="A tool for opening files"
makedepends=("bash" "chrpath" "findutils" "glib2" "amalthea-gdc" "gcc-d")
depends=("glib2" "amalthea-gdc")
pkgver=0.10.0
pkgrel=0
license=("BSL-1.0")

DC=gdc
DC_PKG=gcc-d

pkgname=ufo
pkgdesc="${DESCR}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=${BASE_NAME}-${pkgver}.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v${pkgver}.tar.gz")
sha256sums=("9697b5ab9af6c30f683397a63fbff95ce3ee5a018a52afa3a650eb4f6b01a7bc")

build() {
    cd "${PROJECT}-v${pkgver}"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v${pkgver}"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
