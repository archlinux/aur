# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=pageguard
BASE_NAME=pageguard
DESCR="A tool for saving HTML-pages with all resources embedded"
makedepends=("bash" "chrpath" "findutils" "glib2" "amalthea-gdc" "htmldnext-gdc" "gcc-d")
depends=("glib2" "amalthea-gdc" "htmldnext-gdc")
pkgver=0.2.0
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
sha256sums=("8da6a91af1d7fe8c0280fc4329868391602ef83f200d6b91a358e85df9b25d79")

build() {
    cd "${PROJECT}-v${pkgver}"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v${pkgver}"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
