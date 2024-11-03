# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>
# Contributor: Michael Riegert <michael at eowyn net>
# Contributor: JulioJu  < juanes  0890  at google mail dot com >
# Contributor: Maks Verver <maksverver at geocities dot com>

pkgname=uml_utilities
pkgver=20070815
pkgrel=4
pkgdesc="Utilities for user-mode linux kernel"
arch=(x86_64 i686)
url="http://user-mode-linux.sourceforge.net/"
license=('GPL2')
depends=('fuse2' 'perl')

source=(
    "http://user-mode-linux.sourceforge.net/${pkgname}_${pkgver}.tar.bz2"
    "uml_utilities.patch"
)
sha256sums=('f815f591a1c177729546969acf720958c5fd72b8d4d36bae26fdc5b64669b60e'
            '57588777015901c51f1adb5f61aace93e953d710c2e0a906b5897725c744e5e3')

prepare() {
    cd "tools-$pkgver"

    patch --forward --strip=1 --input=../uml_utilities.patch # fix LIBDIR and CFLAGS
}

build() {
    cd "tools-$pkgver"

    make
}

package() {
    cd "tools-$pkgver"

    make DESTDIR="$pkgdir" install

    mv "$pkgdir/usr/sbin/jail_uml" "$pkgdir/usr/bin/"
    rmdir "$pkgdir/usr/sbin/"
}
