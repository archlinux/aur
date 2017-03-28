# Maintainer: Asyrique Thevendran <asyrique@gmail.com>

pkgname=nodejs-lts-argon-bin
pkgver=4.8.1
pkgrel=1
pkgdesc='Evented I/O for V8 javascript'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='http://nodejs.org/'
license=('MIT')
depends=('openssl' 'zlib' 'python2' 'icu')
optdepends=('npm: nodejs package manager')
provides=('nodejs')
conflicts=('nodejs')

source_i686=("https://nodejs.org/dist/v$pkgver/node-v$pkgver-linux-x86.tar.xz")
source_x86_64=("https://nodejs.org/dist/v$pkgver/node-v$pkgver-linux-x64.tar.xz")
source_armv6h=("https://nodejs.org/dist/v$pkgver/node-v$pkgver-linux-armv6l.tar.xz")
source_armv7h=("https://nodejs.org/dist/v$pkgver/node-v$pkgver-linux-armv7l.tar.xz")
source_aarch64=("https://nodejs.org/dist/v$pkgver/node-v$pkgver-linux-arm64.tar.xz")

sha256sums_i686=("a4723cdd00a34ffbf54827ee66f6c668caf1840aa2b32f20509ed59366e2f29c")
sha256sums_x86_64=("908375af21b27efa271b0c622fdbf9dce617b35969e69cc4f3c2e70cec2ed374")
sha256sums_armv6h=("0ae8578a953d52d8d71423b7c7e44c5b99cce62828f8c75d5c862729c41f8ff9")
sha256sums_armv7h=("73fed31848ca6e9832c0172dfe2ef99d434695d8c3d139d3bf58ae79347ff31d")
sha256sums_aarch64=("3f3dad40de2c16ce373df7ae46a89d229fc191613ddb7fe22883583f4d5223b0")

build() {
    cd */.

    msg 'Fixing for python2 name'
    find lib/ include/ -type f -exec sed \
        -e 's_^#!/usr/bin/env python$_&2_' \
        -e 's_^\(#!/usr/bin/python2\).[45]$_\1_' \
        -e 's_^#!/usr/bin/python$_&2_' \
        -e 's_^\( *exec \+\)python\( \+.*\)$_\1python2\2_'\
        -e 's_^\(.*\)python\( \+-c \+.*\)$_\1python2\2_'\
        -e "s_'python'_'python2'_" -i {} \;

    msg 'Removing npm from install dirs'
    rm -rf lib/node_modules/npm
    rm -rf bin/npm
}

package() {
    cd */.
    install -d $pkgdir/usr/share/licenses/nodejs-lts-boron-bin
    cp -R bin/ include/ lib/ share/ $pkgdir/usr/
    cp LICENSE $pkgdir/usr/share/licenses/nodejs-lts-boron-bin
}
