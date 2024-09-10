# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=adrdox
pkgver=2.6.0
pkgrel=1
pkgdesc='Documentation generator for D'
arch=('x86_64')
url='https://github.com/adamdruppe/adrdox'
license=('BSL-1.0')
depends=('postgresql-libs')
makedepends=('dmd')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('051923562f6eb1e42a2039f9934db06673197dc594f1a9d5c22807028e8eb2324a8b85e6db625d7866aa493f068cf7ad5d2ffb25976c13a6e54de3bd0236a39c')

prepare() {
    cd "$srcdir"/$pkgname-$pkgver
    # Add $LDFLAGS to the compilation
    _linkflags=$(echo -ne $LDFLAGS | sed -e "s/Wl,/L=/g")
    sed -i "s/-g/-g $_linkflags/g" Makefile
}

build() {
    cd "$srcdir"/$pkgname-$pkgver

    # According to Makefile v2.5.4 "use make pq instead ldc is broken"
    # make ldc
    make pq
}

package() {
    cd "$srcdir"/$pkgname-$pkgver

    install -Dm 755 doc2 "$pkgdir"/usr/bin/$pkgname
}
