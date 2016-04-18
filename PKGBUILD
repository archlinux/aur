# Maintainer: Brendan Abolivier <brendan@archlinux.info>

pkgname=nodejs-lts-bin
pkgver=4.4.3
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

sha256sums_i686=("1267b0602e7f7f0c1ab53c841dc71d56dd70c4883396c2e1dc6a1108ab47a622")
sha256sums_x86_64=("3b58583102afbd54214f1ce61d90c7b05e807471bd6ecb084e2fa7de540cdce2")
sha256sums_armv6h=("58627371bc50452fcfbdae66fae043eacde6649ff27fd8b41e2ce42e84720b4e")
sha256sums_armv7h=("e1eaf11800762f45a0b07847c1276ed2c8a13e207ed6ea9938ad992379204131")
sha256sums_aarch64=("b58b1729d3b084255c18c99b31a6db375311ce2effb4f1083cee1b480d03e97f")

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

