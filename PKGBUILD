# Maintainer: Kuan-Yen Chou <kuanyenchou@gmail.com>

pkgname=libredblack
pkgver=1.3
pkgrel=1
pkgdesc='RedBlack balance tree searching and sorting library'
depends=()
makedepends=('gcc' 'make' 'python2')
arch=('any')
url='http://libredblack.sourceforge.net/'
license=('LGPL')
source=("$pkgname-$pkgver.tar.gz"::"https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz/download"
        'rbgen.in.patch')
sha256sums=('a0ecc59b0aae2df01558a6950532c711a782a099277b439a51d270003092f44f'
            '15df219b5b472299198b67405d5ea2431ae82ac307ff9625a9ea381b50ef6f82')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 < "$srcdir/rbgen.in.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --sysconfdir=/etc \
        --with-python=/usr/bin/python2
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}

# vim: set sw=4 ts=4 et:
