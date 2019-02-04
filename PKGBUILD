# vim:ts=4:sw=4:expandtab
# Maintainer: milaq <micha.laqua@gmail.com>
pkgname=dmenu-height
pkgver=4.9
pkgrel=1
pkgdesc="Generic menu for X, with added height setting"
arch=('x86_64')
url="http://tools.suckless.org/dmenu/"
license=('MIT')
provides=('dmenu')
depends=('sh' 'libxinerama' 'libxft' 'freetype2')
conflicts=('dmenu')
source=("https://dl.suckless.org/tools/dmenu-$pkgver.tar.gz"
        "dmenu-lineheight.diff")
sha256sums=('b3971f4f354476a37b2afb498693649009b201550b0c7c88e866af8132b64945'
            '724fcbe8f3c6e4392d3b6a0a4fa6e34c0a3641745e296eed902e561926529d97')
prepare() {
    cd "$srcdir/dmenu-$pkgver"
    patch -p1 -i "$srcdir/dmenu-lineheight.diff"
}

build() {
    cd "$srcdir/dmenu-$pkgver"
    make
}

package() {
    cd "$srcdir/dmenu-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
