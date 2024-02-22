# Maintainer: Cp Dong <cp-dong at outlook dot com>

pkgname=slstatus
pkgver=1.0
pkgrel=1
pkgdesc='A status monitor for window managers that use WM_NAME or stdin to fill the status bar'
arch=(any)
url='http://tools.suckless.org/slstatus/'
depends=('libx11')
conflicts=('slstatus-git')
license=('ISC')
source=('https://dl.suckless.org/tools/slstatus-1.0.tar.gz'
        'config.h')
sha256sums=('6d6d0a16c08dd9d211172c30c4720701267a3f40cdc938db3f386f6a2b6cff54'
            'SKIP')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    if [[ -f "$srcdir/config.h" ]]; then
        cp -fv "$srcdir/config.h" config.h
    fi
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make X11INC='/usr/include/X11' X11LIB='/usr/lib/X11'
}

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX='/usr' DESTDIR="${pkgdir}" install
}
