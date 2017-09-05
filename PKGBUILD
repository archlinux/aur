# Maintainer: Miroslav Koškár <http://mkoskar.com/>

pkgname='away'
pkgver=0.9.5
pkgrel=1
pkgdesc='Terminal locking program'
url='https://packages.debian.org/sid/away'
license=(GPL)
arch=(i686 x86_64)
depends=(pam)

source=(
    http://http.debian.net/debian/pool/main/a/away/away_0.9.5+ds.orig.tar.gz
    01-echo-off.patch
    Makefile
    away.pam
)
sha256sums=(
    14915180d963f1451730e31bdf7dc02e9978236f9839b9f0702474019f74e960
    31e1a4e2dd1bb0340dea709eabcc9fe0c87ddf57a17bd5d49b92af1017fb2d16
    9838c8fa00364e264615a9153247f7a4519bfa40ccabebc0c25a01cfc767a614
    d6efaf99cf53af47ce9e48eda930a15a6a0c3a233a9aaa1b443495fbe2efad87
)

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 <"$srcdir/01-echo-off.patch"
    cp "$srcdir/Makefile" .
    cp "$srcdir/away.pam" data
}

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
