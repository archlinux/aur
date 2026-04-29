# Maintainer: Michiru Saito <urihcim at gmail dot com>
pkgname=hxavi
pkgver=1.2.1.20260309
pkgrel=1
pkgdesc="A binary editor for vi and Vim users"
arch=(x86_64)
url="https://hxavi.net/en/en-home/"
license=('BSD-2-Clause')
depends=('glibc' 'ncurses')
source=("https://hxavi.net/files/$pkgname-$pkgver.tar.gz"
        'hxavi-ncurses.patch')
sha256sums=('d9751231e930404372ebfd9278b04ee74c4356012600e4ef216a973b12d86f22'
            '5d4690395523ce566c3f82d5d7d2f38c32468e88c139a496e430526b40516f4d')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 -i "$srcdir/hxavi-ncurses.patch"
}

build() {
    cd "$pkgname-$pkgver"
    make CFLAGS="$LDFLAGS" "$pkgname"
}

package() {
    cd "$pkgname-$pkgver"

    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/doc"

    make PREFIX="$pkgdir/usr" install

    install -d -m0755 "${pkgdir}/usr/share/licenses/hxavi/"
    ln -sf /usr/share/doc/hxavi/copyright "${pkgdir}/usr/share/licenses/hxavi/"
}
