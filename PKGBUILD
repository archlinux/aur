# Maintainer: Frank Seifferth <frankseifferth@posteo.net>
pkgname=trek
_pkgver=2.17-29
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="The version of trek found in debian's bsdgames collection"
license=('custom:BSD')
arch=('any')
url="https://salsa.debian.org/games-team/bsdgames"
source=("https://salsa.debian.org/games-team/bsdgames/-/archive/debian/$_pkgver/bsdgames-debian-$_pkgver.tar.gz")
md5sums=('d660325e6cc9b7cd7e730f2e5a66e933')

build() {
    cd "bsdgames-debian-$_pkgver"
    ./configure </dev/null
    #cat debian/patches/*.patch | patch -p1
    make trek_all
    gzip <trek/trek.6 >trek/trek.6.gz
}

package() {
    cd "bsdgames-debian-$_pkgver"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 trek/trek.6.gz "$pkgdir/usr/share/man/man6/trek.6.gz"
    install -Dm755 trek/trek "$pkgdir/usr/games/trek"
    install -Dm644 trek/USD.doc/trek.me \
        "$pkgdir/usr/share/doc/bsd-games/trek.me"
}
