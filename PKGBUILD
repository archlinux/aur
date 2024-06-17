# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=amalthea
DESCR="Small general library for the D programming language"
makedepends=("bash" "chrpath" "findutils" "glib2" "ldc")
depends=("dialog" "glib2" "ldc")
pkgver=1.7.1
pkgrel=1
license=("BSL-1.0 or LGPL-3+")

DC=ldc2
DC_PKG=ldc

pkgname=${PROJECT}-${DC}
pkgdesc="${DESCR}, version for ${DC^^}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=$pkgname-$pkgver.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v$pkgver.tar.gz")
sha256sums=("e99c5e9e460f8cd0b39c4f256151f015afed11ed4283d2f90d1cc3e1d7666351")

build() {
    cd "${PROJECT}-v$pkgver"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir install DC=${DC} || return 1
}
