# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=pageguard
BASE_NAME=pageguard
DESCR="A tool for saving HTML-pages with all resources embedded"
makedepends=("bash" "chrpath" "findutils" "glib2" "amalthea-ldc2" "gcc-d")
depends=("glib2" "amalthea-ldc2")
pkgver=0.1.5
pkgrel=0
license=("BSL-1.0")

DC=gdc
DC_PKG=gcc-d

pkgname=pageguard
pkgdesc="${DESCR}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=${BASE_NAME}-${pkgver}.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v${pkgver}.tar.gz")
sha256sums=("51b7cfa83eb33a07b2cb42b180f20df0fd66de0128ba2937dd132fa35fb44899")

build() {
    cd "${PROJECT}-v${pkgver}"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v${pkgver}"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
