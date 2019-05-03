# vim:ts=4:sw=4:expandtab
# Maintainer: milaq <micha.laqua@gmail.com>
pkgname=dmenu-height
pkgver=4.9
pkgrel=3
pkgdesc="Generic menu for X, with added height setting"
arch=('x86_64')
url="http://tools.suckless.org/dmenu/"
license=('MIT')
provides=('dmenu')
depends=('sh' 'libxinerama' 'libxft' 'freetype2')
conflicts=('dmenu')
source=("https://dl.suckless.org/tools/dmenu-$pkgver.tar.gz"
        "https://tools.suckless.org/dmenu/patches/line-height/dmenu-lineheight-4.9.diff"
        "dmenu-revert-IME-support.diff")
sha256sums=('b3971f4f354476a37b2afb498693649009b201550b0c7c88e866af8132b64945'
            '4f7f6f46b23cbc3f38bcc7eff24a0cb74b8bc8651c2de29aa3adc4f16b4dc06c'
            '433c3d66554f68258bd9140fdbbd75be8934e27cf0b2cc3becf08f3bc1c8b091')
prepare() {
    cd "$srcdir/dmenu-$pkgver"
    patch -p1 -i "$srcdir/dmenu-lineheight-4.9.diff"
    patch -p1 -i "$srcdir/dmenu-revert-IME-support.diff"
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
