#-*- mode: sh; -*-

# Maintainer: Bart Libert <bart dot libert at gmail dot com>
# Contributor: Tad Fisher <tadfisher at gmail dot com>
pkgname=jasmine-gjs-git
pkgver=2.2.1.r18.g88c2e56
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
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
