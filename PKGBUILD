# Maintainer: Matthew Taylor <mtaylor1252dev@gmail.com>

pkgname=st-yutna
_pkgname=st
pkgver=0.8.2
pkgrel=1
pkgdesc="Simple terminal emulator."
arch=("x86_64")
url="https://st.suckless.org/"
license=("MIT")
depends=("libxft" "ttf-roboto-mono")
provides=("st")
source=(https://dl.suckless.org/st/$_pkgname-$pkgver.tar.gz
    st-yutna-$pkgver.diff
    st-no_bold_colors-$pkgver.diff
    st-solarized-dark-$pkgver.diff)
sha256sums=("aeb74e10aa11ed364e1bcc635a81a523119093e63befd2f231f8b0705b15bf35"
    "4e6ae20701290278bb9f4c1243a40d85b6bcc83d8478df964867df6c9b38fe8e"
    "8879e5a0dd1b529e5dc6905ae8b64b217f3b85f1a1d3c9d69e23f752c5539b6b"
    "1f5aa16f454a413b2f9c4e7f67e7b620607178365fdd0f15e62ba3922f9b531d")

prepare() {
    cd $srcdir/$_pkgname-$pkgver
    patch -p1 -i $srcdir/st-yutna-$pkgver.diff
    patch -p1 -i $srcdir/st-no_bold_colors-$pkgver.diff
    patch -p1 -i $srcdir/st-solarized-dark-$pkgver.diff
}

build() {
    cd $srcdir/$_pkgname-$pkgver
    make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    make PREFIX=/usr DESTDIR=$pkgdir install
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE
    install -Dm644 README $pkgdir/usr/share/doc/$_pkgname/README
}

