# Maintainer: Brendan Abolivier <brendan@archlinux.info>

pkgname=nodejs-lts-bin
pkgver=4.5.0
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

sha256sums_i686=("0f5e51d913867eaf71332cd20fd9a98aeb3576b8a22a52e8e1cd97c89cf51feb")
sha256sums_x86_64=("c6ee1f4303353e3605ff70de180431417eb594fe08daf612e692216236750c55")
sha256sums_armv6h=("bc3e33872b009e18f084efb9a595cc12cf8314df125ce80c2e8bde1c2213b5f1")
sha256sums_armv7h=("c01482d423b646542ba037cb5ce646cb26518aa2dc9f7728520e7ac1247932b3")
sha256sums_aarch64=("9034e67629e1912d6dc0632627528565d9e412c6eba410d171f9fd80f700f84f")

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

