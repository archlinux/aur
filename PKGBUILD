# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>

PROJECT=amalthea
DESCR="Small general library for the D programming language"
DC=ldc2
DC_PKG=ldc
makedepends=("bash" "chrpath" "lsb-release" "pkgconf" "glib2" "ldc")
depends=("ldc")
pkgver=1.4.0
pkgrel=1
license=("Boost or LGPL3")

pkgname=${PROJECT}-${DC}
pkgdesc="${DESCR}, version for ${DC^^}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=$pkgname-$pkgver.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v$pkgver.tar.gz")
sha256sums=("d67e3a1dcba7a4f524916ea3ecfbba4ec7519ecce478e3f441b514773e36b1f0")

build() {
    cd "${PROJECT}-v$pkgver"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir install DC=${DC} || return 1
}
