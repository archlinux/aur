# Maintainer: Asyrique Thevendran <asyrique@gmail.com>

pkgname=nodejs-lts-boron-bin
pkgver=6.9.4
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

sha256sums_i686=("4a9d2c4472015926a06402cec8089aae33e57fd7f649fa0e1a74160757d771f9")
sha256sums_x86_64=("d28c331e1af88468e8220477e9b4d48d4ce041855b9c939ea2320de2929e7ce1")
sha256sums_armv6h=("c230178d372d75c655c91454a63b725fb3c471b616617f4e13dcf6a5fc958f6a")
sha256sums_armv7h=("71cf9b7d906fe659fdb7e13f8f5e7604b1c21e23ac17d7f1debe6c05384c6e9e")
sha256sums_aarch64=("0845e6941b2114da16608cfddde67c81cb7dcd8ebe10fd46d556b9c0b5bd9d89")

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
