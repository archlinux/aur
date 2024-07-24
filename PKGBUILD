#-*- mode: sh; -*-

# Maintainer: Bart Libert <bart dot libert at gmail dot com>
pkgname=jasmine-gjs
pkgver=3.10.1
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
sha256sums=('2a42dfe57bb65a880df299f1f7cabaa8257d175e50422bc6b7c2173266a35e80')
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
