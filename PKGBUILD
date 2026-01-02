# Maintainer: Eduard Vidal <aur@lestudi.com>
pkgname=tryton
pkgver=7.8.1
pkgrel=1
_pkgdir=7.8
pkgdesc="Tryton desktop client"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6' 'python-cairo' 'python-dateutil' 'python-pygobject-stubs' 'pygobject-devel')
makedepends=('python-setuptools')
source=("http://downloads.tryton.org/$_pkgdir/$pkgname-last.tar.gz"
        "http://downloads.tryton.org/$_pkgdir/$pkgname-last.tar.gz.asc"
        'tryton.desktop'
        'tryton-icon.png')
sha256sums=('5d9ac201478e1d5e31cfeaca0a6465ea7dc516ab6667bfb08653862ba190ce2c'
            'SKIP'
            '78378206bbd3264cbcf23e2836e4bbb70ad1ea643c4db71dccf997ff2fb06443'
            'ef2440c3f8f905e8636a07e5d032939bbf835b25bc7e998482cbbf4c78878831')
validpgpkeys=('7C5A4360F6DF81ABA91FD54D6FF50AFE03489130') # Cédric Krier

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1

    # Fitxer .desktop
    install -D -m644 "$srcdir/tryton.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Icónes en rutes estàndard hicolor
    install -D -m644 "$srcdir/tryton-icon.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
    install -D -m644 "$srcdir/tryton-icon.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
    install -D -m644 "$srcdir/tryton-icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"

    # Fitxer pixmaps per compatibilitat amb altres entorns
    install -D -m644 "$srcdir/tryton-icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
