# Maintainer: Brendan Abolivier <brendan@archlinux.info>

pkgname=nodejs-lts-bin
pkgver=4.6.2
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

sha256sums_i686=("1a6e5e2c671637182c66b5c26c576fe228055a9ddaf16f1492c56a155fa3a810")
sha256sums_x86_64=("309f3d7bb0a4929a7e723d4fc65ee2773cf8ba334604b0d139c8691c06815cfc")
sha256sums_armv6h=("2f1ae711d425cec2e028917907ce82039a1422a0454480000a17281f57b271d0")
sha256sums_armv7h=("515a8f80ae7d9ba02dcec3591cf42d62716efb178f19f971da4cf58862da6161")
sha256sums_aarch64=("389e9987852d5f813d7708602b84a9ef94b28bcfe2e080afcd5b6871ab36c0f8")

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

