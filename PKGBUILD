# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=ufo
DESCR="A tool for opening files"
makedepends=("bash" "chrpath" "findutils" "glib2" "amalthea-ldc2" "ldc")
depends=("glib2" "amalthea-ldc2")
pkgver=0.7.6
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
sha256sums=("c91f75d63746bde3a6f0a6631c56113097e8d55833a014880bc8b21b6bd80c6c")

build() {
    cd "${PROJECT}-v$pkgver"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
