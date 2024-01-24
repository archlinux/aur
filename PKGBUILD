# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=amalthea
DESCR="Small general library for the D programming language"
makedepends=("bash" "chrpath" "findutils" "glib2" "gcc-d")
depends=("dialog" "glib2" "gcc-d")
pkgver=1.6.0
pkgrel=1
license=("BSL-1.0 or LGPL-3+")

DC=gdc
DC_PKG=gcc-d

pkgname=${PROJECT}-${DC}
pkgdesc="${DESCR}, version for ${DC^^}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=$pkgname-$pkgver.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v$pkgver.tar.gz")
sha256sums=("a66b89423d4ad272a32e7add467f5707e1faefad15022950af9b321936b45e13")

build() {
    cd "${PROJECT}-v$pkgver"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir install DC=${DC} || return 1
}
