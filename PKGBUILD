#-*- mode: sh; -*-

# Maintainer: Tad Fisher <tadfisher at gmail dot com>
pkgname=jasmine-gjs-git
pkgver=2.2.1.r11.g7f12b66
pkgrel=1
pkgdesc='Run Jasmine specs for GJS code'
arch=('any')
url='https://github.com/ptomato/jasmine-gjs'
license=('MIT')
depends=('gjs')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/ptomato/jasmine-gjs.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install
}
