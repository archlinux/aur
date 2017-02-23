# Maintainer: Asyrique Thevendran <asyrique@gmail.com>

pkgname=nodejs-lts-argon-bin
pkgver=4.8.0
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

sha256sums_i686=("cd5e5e35398dc0fb347fbfefbf167b653d2b304bbd6d33b634bbe96b1c381f94")
sha256sums_x86_64=("4597861fbbcfc120be608ec6ba18a61c5951d4093cf149bf98097972a4927a80")
sha256sums_armv6h=("1c828dbd59a2b5e226c5cce772cd6c4a01aaaa06f9c19ef06d9666b53fd54b5b")
sha256sums_armv7h=("ad05bf930ecbcda934628b33fa4f8dda909cbd30a9577d0b70f18ecb3774900d")
sha256sums_aarch64=("e0f5f7a2458c715c60ecb3966ee29bcdae95acceb2a611bd920ce1c649174732")

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
