# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=peazip-gtk2-portable
pkgver=6.0.3
pkgrel=1
pkgdesc="Natively compiled 64-bit GTK2 archiver utility, portable version with no dependencies"
arch=(x86_64)
url=http://www.peazip.org/peazip-linux-64.html
license=(LGPL3)
depends=(gtk2)
provides=('peazip')
conflicts=('peazip-gtk2' 'peazip-qt')
install=peazip.install
source=("https://github.com/giorgiotani/PeaZip/releases/download/$pkgver/peazip_portable-$pkgver.LINUX.x86_64.GTK2.tar.gz"
        'peazip.png')
sha256sums=('e71a286acf361787e7f0b02a6372a7e92401d33160b25cc29331c451fab2adb8'
            'b8c7f3d52309cc9d39db57d2d785a03b3611f48fc0446cc10592112fdf599aff')

package() {
    install -Dm755 "$srcdir/peazip_portable-$pkgver.LINUX.x86_64.GTK2/peazip"\
                   "$pkgdir/opt/$pkgname/peazip"
    install -Dm644 "$srcdir/peazip_portable-$pkgver.LINUX.x86_64.GTK2/copying.txt"\
                   "$pkgdir/usr/share/licenses/$pkgname/COPYING.txt"
    install -Dm644 "$srcdir/peazip_portable-$pkgver.LINUX.x86_64.GTK2/peazip_help.pdf"\
                   "$pkgdir/usr/share/doc/$pkgname/peazip_help.pdf"
    install -Dm644 "$srcdir/peazip.png" "$pkgdir/usr/share/pixmaps/peazip.png"
    mv "$srcdir/peazip_portable-$pkgver.LINUX.x86_64.GTK2/res" "$pkgdir/opt/$pkgname"

    cd "$srcdir"
    cp "$srcdir/peazip_portable-$pkgver.LINUX.x86_64.GTK2/FreeDesktop_integration/peazip-alt(multilingual).desktop"\
       "$srcdir/peazip.desktop"
    cd "$srcdir"
    desktop-file-install -m 644 --dir="$pkgdir/usr/share/applications/" --set-key="Exec" --set-value="gksu peazip %F" "peazip.desktop"
    cd "$srcdir/peazip_portable-$pkgver.LINUX.x86_64.GTK2/FreeDesktop_integration"
}
