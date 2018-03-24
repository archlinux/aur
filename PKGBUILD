# vim:ts=4:sw=4:expandtab
# Maintainer: milaq <micha.laqua@gmail.com>
pkgname=dmenu-height
pkgver=4.8
pkgrel=1
pkgdesc="Generic menu for X, with added height setting"
arch=('x86_64')
url="http://tools.suckless.org/dmenu/"
license=('MIT')
provides=('dmenu')
depends=('sh' 'libxinerama' 'libxft' 'freetype2')
conflicts=('dmenu')
source=("http://dl.suckless.org/tools/dmenu-$pkgver.tar.gz"
        "https://tools.suckless.org/dmenu/patches/dmenu-lineheight-4.7.diff")
sha256sums=('fe615a5c3607061e2106700862e82ac62a9fa1e6a7ac3d616a9c76106476db61'
            '779de570f7a0e81c23e522a68aed21c50830b8f39982a7f4af022324c65e1f67')
prepare() {
    cd "$srcdir/dmenu-$pkgver"
    patch -p1 -i "$srcdir/dmenu-lineheight-4.7.diff"
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
