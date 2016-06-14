# Maintainer: Brendan Abolivier <brendan@archlinux.info>

pkgname=nodejs-lts-bin
pkgver=4.4.5
pkgrel=1
pkgdesc='Evented I/O for V8 javascript'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='http://nodejs.org/'
license=('MIT')
depends=('openssl' 'zlib' 'python2' 'icu')
provides=('nodejs' 'npm')
conflicts=('nodejs' 'npm')

source_i686=("https://nodejs.org/dist/v$pkgver/node-v$pkgver-linux-x86.tar.xz")
source_x86_64=("https://nodejs.org/dist/v$pkgver/node-v$pkgver-linux-x64.tar.xz")
source_armv6h=("https://nodejs.org/dist/v$pkgver/node-v$pkgver-linux-armv6l.tar.xz")
source_armv7h=("https://nodejs.org/dist/v$pkgver/node-v$pkgver-linux-armv7l.tar.xz")
source_aarch64=("https://nodejs.org/dist/v$pkgver/node-v$pkgver-linux-arm64.tar.xz")

sha256sums_i686=("354afb7fac8cb8dc3b926a4adb0901dd6ac42cb605f988f05f60f0bb8553a2c4")
sha256sums_x86_64=("bd6505d8a350cd83907374ea98730b0ba99b97ec45cee418d453a0154384805a")
sha256sums_armv6h=("ae6a05b4dae19d31d2dd7de07c60ab4672d7aafacd0796974269432e451dd59b")
sha256sums_armv7h=("07f6610d91e4f03a28a97f1fd54a0b0547545fd5501657e30272a1a97604b709")
sha256sums_aarch64=("83c6a16989489908ea6be93f21a37316b4513d581875c3653ebeadd1c67d2e70")

build() {
    cd node-*

    msg 'Fixing for python2 name'
    find lib/ include/ -type f -exec sed \
        -e 's_^#!/usr/bin/env python$_&2_' \
        -e 's_^\(#!/usr/bin/python2\).[45]$_\1_' \
        -e 's_^#!/usr/bin/python$_&2_' \
        -e 's_^\( *exec \+\)python\( \+.*\)$_\1python2\2_'\
        -e 's_^\(.*\)python\( \+-c \+.*\)$_\1python2\2_'\
        -e "s_'python'_'python2'_" -i {} \;
}

package() {
    cd node-*
    install -d $pkgdir/usr/share/licenses/nodejs-lts-bin
    cp -R bin/ include/ lib/ share/ $pkgdir/usr/
    cp LICENSE $pkgdir/usr/share/licenses/nodejs-lts-bin
}

