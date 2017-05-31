# Maintainer: Asyrique Thevendran <asyrique@gmail.com>

pkgname=nodejs-lts-argon-bin
pkgver=4.8.3
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

sha256sums_i686=("f4db97d419791ccc03b3430f94027db25fe0893d55a9faa8565f4426db226438")
sha256sums_x86_64=("ca26fee56642f01f6b678d498cbe9b4bd611d8ea07ea5ef63d91f9768c8c6243")
sha256sums_armv6h=("dd1b6a31ae77a639b6758c00bc5fc76316233672487330041f8e3366f271821f")
sha256sums_armv7h=("3e2f4c8e7c0a6fe2578f42b7cf5e67d6be6a24bc564dbecde3e0ecb49fb11a2e")
sha256sums_aarch64=("fb3154197f9a83c64f09643ea73fb8b18002cc1270b8dd6a572ed1e5f1633edd")

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
