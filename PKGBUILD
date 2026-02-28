# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=hgen
DESCR="Documentation generator for D"
makedepends=("bash" "findutils" "pkg-config" "libdparse-ldc2" "ldc")
depends=("" "libdparse-ldc2")
pkgver=0.6.2
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
sha256sums=("897bea890b915370b89513f8248770ab32c0c7ea0886e0729e5d1ad6b5374e35")

build() {
    cd "${PROJECT}-v$pkgver"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
