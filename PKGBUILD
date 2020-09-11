#-*- mode: sh; -*-

# Maintainer: Bart Libert <bart dot libert at gmail dot com>
pkgname=jasmine-gjs
pkgver=2.5.2
pkgrel=1
pkgdesc='Run Jasmine specs for GJS code'
arch=('any')
url='https://github.com/ptomato/jasmine-gjs'
license=('MIT')
depends=('gjs')
makedepends=('git' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("https://github.com/ptomato/jasmine-gjs/archive/$pkgver.tar.gz")
sha256sums=('a689d54e4d9a989ab87ff11a7340685393abd05efb5d67a9f44ca67abd18f18b')
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
