# Maintainer: Asyrique Thevendran <asyrique@gmail.com>

pkgname=nodejs-lts-boron-bin
pkgver=6.10.1
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

sha256sums_i686=("1e8be5c912cb31e7221836d3f988432e63a1564b2213a673259367f9f7222b1e")
sha256sums_x86_64=("e8f100e9ee70eb63216b33cf39666a4dc6c4038f6ee4fbfc7751ab3a825e576c")
sha256sums_armv6h=("277a85ddd93581a48798e87ef568d5353d03e50bb2af04a9fb54ee4d115fb022")
sha256sums_armv7h=("aa16b41344fcdce55efff1a5b43d921f9721cdfc0eebe12ea3306cad832c5b90")
sha256sums_aarch64=("c361ca0b508fcdfcd0e07e588b5cc38f32c547c94eb6a60e30980dfda2b35df9")

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
