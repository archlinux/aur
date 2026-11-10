# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=ufo
BASE_NAME=ufo
DESCR="A tool for opening files"
makedepends=("bash" "chrpath" "findutils" "glib2" "amalthea-ldc2" "ldc")
depends=("glib2" "amalthea-ldc2")
pkgver=0.10.2
pkgrel=0
license=("BSL-1.0")

DC=ldc2
DC_PKG=ldc

pkgname=ufo
pkgdesc="${DESCR}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=${BASE_NAME}-${pkgver}.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v${pkgver}.tar.gz")
sha256sums=("fb39ea50e74d0e7dc643575803d67310cd63d61f6eb8351fbbd6a159d00cfadc")

build() {
    cd "${PROJECT}-v${pkgver}"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v${pkgver}"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
