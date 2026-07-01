# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=pageguard
DESCR="A tool for saving HTML-pages with all resources embedded"
makedepends=("bash" "chrpath" "findutils" "glib2" "amalthea-ldc2" "ldc")
depends=("glib2" "amalthea-ldc2")
pkgver=0.1.4
pkgrel=0
license=("BSL-1.0")

DC=ldc2
DC_PKG=ldc

pkgname=${PROJECT}
pkgdesc="${DESCR}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=$pkgname-$pkgver.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v$pkgver.tar.gz")
sha256sums=("5f4d2595abfea38f13fa18eea99829f7735b6ebc484b47feb148a8b89cb2d828")

build() {
    cd "${PROJECT}-v$pkgver"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
