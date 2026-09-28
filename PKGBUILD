# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=archivemount-ng
pkgver=1c
pkgrel=1
pkgdesc='FUSE based filesystem for mounting compressed archives (new upstream)'
arch=(x86_64)
url=https://git.sr.ht/~nabijaczleweli/$pkgname
license=('0BSD AND LGPL-2.0-or-later')
depends=(fuse3 glibc libarchive libstdc++)
provides=(archivemount)
conflicts=(archivemount)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz
        $pkgname-$pkgver.tar.gz.asc::$url/archive/$pkgver.tar.gz.asc)
validpgpkeys=('7D69474E84028C5CC0C44163BCFD0B018D2658F1') # nabijaczleweli <nabijaczleweli@nabijaczleweli.xyz>
b2sums=('4c401a57546e0e204e90224d19af88164320248b011544e18050ca2373c0e88043ca6d0a5f78472c30ef4866f05f8dd8de5e9c4faa2d6b3eeb79e4ba85e0a630'
        'SKIP')

build() {
    cd $pkgname-$pkgver
    # Set manual page date since tarball build can't use git to determine it
    make MANUAL_DATE="June 16, 2024" VERSION=$pkgver
}

check() {
    cd $pkgname-$pkgver
    make -k check
}

package() {
    cd $pkgname-$pkgver
    install -Dm644 LICENSES/0BSD.txt -t "$pkgdir/usr/share/licenses/$pkgname"
    make DESTDIR="$pkgdir/" PREFIX=usr install
}
