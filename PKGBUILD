# Maintainer: Brendan Abolivier <brendan@archlinux.info>

pkgname=nodejs-lts-bin
pkgver=4.4.4
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

sha256sums_i686=("7c0771b0153dd1c6609197b7b56840085df5d0752862fe4e98569d8d7bcb8682")
sha256sums_x86_64=("c8b4e3c6e07e51593dddbf1d2ec3cf0ec09d5c6b8c5258b37b3816cc6b7e9fe3")
sha256sums_armv6h=("c1a67dc4c7080b4082d165861d44a1f3279adec18279edc927329d153ab5b657")
sha256sums_armv7h=("9df9d2bb7335a3118ed20a8332df40659294bfe04896c49d7e4890d7f667c495")
sha256sums_aarch64=("e50d47bdd5fe26a249449059244222e06f98513209027bf557bf809e24e17400")

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

