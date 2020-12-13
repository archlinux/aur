# Maintainer: Hiroshi Hatake <cosmo0920.wp[at]gmail.com>

pkgname=snowball-c-git
pkgver=20201213.662.d29510a
pkgrel=1
pkgdesc="Snowball compiler and stemming algorithms ."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/snowballstem/snowball"
license=('BSD-3')
source=("$pkgname"::"git+https://github.com/snowballstem/snowball#branch=master")
depends=('gcc')

pkgver () {
    _date=`date +"%Y%m%d"`
    cd "${srcdir}/${pkgname}"
    echo "$_date.$(git rev-list --count master).$(git rev-parse --short master)"
}

build() {
    cd $srcdir/$pkgname
    make
}

package() {
    cd $srcdir/$pkgname
    install -Dm644 include/* $pkgdir/usr/include/libstemmer.h
    install -Dm644 libstemmer.o $pkgdir/usr/lib/libstemmer.a
    install -Dm755 snowball $pkgdir/usr/bin/snowball
    install -Dm755 stemwords $pkgdir/usr/bin/stemwords
}
sha1sums=('SKIP')
