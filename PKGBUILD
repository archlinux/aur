#!/bin/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=kddockwidgets
pkgver=1.2.0
pkgrel=1
arch=('x86_64')
pkgdesc="KDAB's Dock Widget Framework for Qt"
license=("GPL2" "custom:KDAB commercial license")
depends=('qt5-base' 'qt5-x11extras')
makedepends=('cmake' 'ninja' 'qt5-tools')
url="https://github.com/KDAB/KDDockWidgets"
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cmake -S "$srcdir/$pkgname" -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -G Ninja
    ninja -C "$srcdir/build" ${MAKEFLAGS:--j1}
}

package() {
    DESTDIR="${pkgdir}" ninja -C "$srcdir/build" install
}
