#-*- mode: sh; -*-

# Maintainer: Bart Libert <bart dot libert at gmail dot com>
pkgname=jasmine-gjs
pkgver=2.6.4
pkgrel=1
pkgdesc='Run Jasmine specs for GJS code'
arch=('any')
url='https://github.com/ptomato/jasmine-gjs'
license=('MIT')
depends=('gjs')
makedepends=('git' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("https://github.com/ptomato/jasmine-gjs/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('66f52852d14c81411e6a1cee04c78f313b3bdae44ee55bce3a9d116650f6a384')
conflicts=('jasmine-gjs-git')
provides=('jasmine')

build() {
    arch-meson "$srcdir/$pkgname-$pkgver" _build
    meson compile -C _build
}

package() {
    DESTDIR="$pkgdir/" meson install -C _build
    install -Dm644 "$srcdir/$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname-$pkgver/LICENSE"
}
