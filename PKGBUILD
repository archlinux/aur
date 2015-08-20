# Maintainer: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Sergej Pupykin <pupykin.s+arch at gmail dot com>
# Contributor: Dag Odenhall <dag.odenhall at gmail dot com>
# Contributor: Grigorios Bouzakis <grbzks at gmail dot com>
# Contributor: mahkoh <cszimd at gmail dot com>

pkgname=dwm-pango
_pkgname=dwm
pkgver=6.0
pkgrel=4
pkgdesc="A dynamic window manager for X - with Pango support"
url="http://dwm.suckless.org"
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxinerama' 'pango')
options=(zipman)
provides=('dwm')
conflicts=('dwm')
install=dwm.install
source=(http://dl.suckless.org/dwm/dwm-$pkgver.tar.gz
        dwm-6.0-pango.patch
        config.h)
sha256sums=('b2b9483de69259eeea56844899bb2385158d3e79a42d82b10c142099fc8eeb56'
            '44c0208f75e6cf908a584eabe13df57c162d2675b267e672445711a7138359bc'
            'aa9910cfe973d82428dac7da8772fa9b67c94e8ad577d6e088ade4aea2690d54')

prepare() {
    cd ${_pkgname}-$pkgver
    patch -Np1 -i ../dwm-6.0-pango.patch
    cp ../config.h config.h
}

build() {
    cd ${_pkgname}-$pkgver
    make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
    cd ${_pkgname}-$pkgver
    make PREFIX=/usr DESTDIR="$pkgdir" install

    install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -m644 -D README "$pkgdir/usr/share/doc/$pkgname/README"
}
