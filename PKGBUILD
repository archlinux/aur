# Maintainer:  Sergio Tridente <tioduke (at) gmail (dot) com>

_pkgname=CutyCapt
pkgname=cutycapt-qt5-git
pkgver=12.bea8c78
pkgrel=1
pkgdesc="A Qt and WebKit based command-line utility that captures WebKit's rendering of a web page."
arch=('i686' 'x86_64')
url="http://cutycapt.sourceforge.net/"
license=('GPL')
depends=('qt5-base' 'qt5-svg' 'qt5-webkit')
makedepends=('git' 'gcc' 'make')
provides=('cutycapt')
conflicts=('cutycapt')
source=('git+https://github.com/hoehrmann/CutyCapt.git'
        'fix-qt5-printsupport.patch')
md5sums=('SKIP'
         '42b0b1add774a0f33784bdb9d8998911')

pkgver() {
   cd "$srcdir/${_pkgname}"
   echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
    cd "$srcdir/${_pkgname}"
    patch --binary -Np0 < "${srcdir}/fix-qt5-printsupport.patch"
}

build() {
    cd "$srcdir/${_pkgname}"
    qmake-qt5 CutyCapt.pro DESTDIR="$srcdir/${_pkgname}"
    make
}

package() {
    cd "$srcdir/${_pkgname}"
    install -Dm755 "CutyCapt" "${pkgdir}/usr/bin/CutyCapt"
}
