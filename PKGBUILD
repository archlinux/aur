# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=hgen
BASE_NAME=hgen
DESCR="Documentation generator for D"
makedepends=("bash" "findutils" "pkg-config" "libdparse-ldc2" "ldc")
depends=("" "libdparse-ldc2")
pkgver=0.7.0
pkgrel=0
license=("BSL-1.0")

DC=ldc2
DC_PKG=ldc

pkgname=hgen
pkgdesc="${DESCR}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=${BASE_NAME}-${pkgver}.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v${pkgver}.tar.gz")
sha256sums=("e2be47106a879a1260b24ac4f738a911450c5d879c27117585970a41f709c94f")

build() {
    cd "${PROJECT}-v${pkgver}"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v${pkgver}"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
