# Maintainer: Matthew Taylor <mtaylor1252dev@gmail.com>

pkgname=st-yutna
_pkgname=st
pkgver=0.8.4
pkgrel=1
pkgdesc="Simple terminal emulator."
arch=("x86_64")
url="https://st.suckless.org/"
license=("MIT")
depends=("libxft" "ttf-roboto-mono")
provides=("st")
source=(https://dl.suckless.org/st/$_pkgname-$pkgver.tar.gz
    st-yutna-$pkgver.diff
    st-no-bold-colors-$pkgver.diff
    st-solarized-dark-$pkgver.diff)
sha256sums=("d42d3ceceb4d6a65e32e90a5336e3d446db612c3fbd9ebc1780bc6c9a03346a6"
    "681b24332e93fbe6a48a6440a682f51db69e43f9ad606a8c2d657bbad409cde2"
    "4edca37de88f0c39e2686153f1180252af1d4c47b202cebea01e2776e25bac4a"
    "9aa1095d208bdf38f26d4fa49d690210c3111e78a299ccac4b89097c176bd8c8")

prepare() {
    cd $srcdir/$_pkgname-$pkgver
    patch -p1 -i $srcdir/st-yutna-$pkgver.diff
    patch -p1 -i $srcdir/st-no-bold-colors-$pkgver.diff
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

