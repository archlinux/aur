# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=libredblack
pkgver=1.3
pkgrel=3
pkgdesc='RedBlack balance tree searching and sorting library'
depends=('python')
makedepends=()
arch=('x86_64')
url='http://libredblack.sourceforge.net/'
license=('LGPL-2.1-or-later')
source=("$pkgname-$pkgver.tar.gz"::"https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz/download"
        'rbgen.in.patch'
        "$pkgname-$pkgver-rbgen-python3.patch"
        "$pkgname-$pkgver-rbgen-runtime-fixes.patch")
sha256sums=('a0ecc59b0aae2df01558a6950532c711a782a099277b439a51d270003092f44f'
            '15df219b5b472299198b67405d5ea2431ae82ac307ff9625a9ea381b50ef6f82'
            '2295abb57e468a930b2bf16b0cb74fc92e5b9af98bb5826415bb09eba19be5a6'
            '5b4a58f730da640264059c8501b579c5a4a10d8caa572197037365adae3a0709')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 < "$srcdir/rbgen.in.patch"
    patch -p1 < "$srcdir/$pkgname-$pkgver-rbgen-python3.patch"
    patch -p1 < "$srcdir/$pkgname-$pkgver-rbgen-runtime-fixes.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --sysconfdir=/etc \
        --mandir=/usr/share/man \
        --with-python=/usr/bin/python
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}

# vim: set sw=4 ts=4 et:
