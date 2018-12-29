# Maintainer: Matthew Taylor <mtaylor1252dev@gmail.com>

pkgname=st-yutna
_pkgname=st
pkgver=0.8.1
pkgrel=2
pkgdesc="Simple terminal emulator."
arch=("x86_64")
url="https://st.suckless.org/"
license=("MIT")
depends=("libxft" "ttf-roboto-mono")
provides=("st")
source=(https://dl.suckless.org/st/$_pkgname-$pkgver.tar.gz
    st-yutna-0.8.1.diff
    st-solarized-dark-0.8.1.diff)
sha256sums=("c4fb0fe2b8d2d3bd5e72763e80a8ae05b7d44dbac8f8e3bb18ef0161c7266926"
    "499c4aed075dcb4198f50a6b0da17e111ebd6b8e26925659e4b53dc29b87d99b"
    "b2d5e88a2616eafb82b2fefb63eecb0f9d71f839349ef40f9f69c1953444f88c")

prepare() {
    cd $srcdir/$_pkgname-$pkgver
    patch -p1 -i $srcdir/st-yutna-0.8.1.diff
    patch -p1 -i $srcdir/st-solarized-dark-0.8.1.diff
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

