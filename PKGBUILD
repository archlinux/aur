# Contributor: Hoàng Đức Hiếu <arch@zahe.me>
# Maintainer : Marcos Heredia <chelqo@gmail.com>

pkgname=viewpdf
pkgver=0.6.2
pkgrel=2
pkgdesc="ViewPDF shows PDF files, clearly indicating annotations and possible mistakes"
url="http://www.qtrac.eu/viewpdf.html"
screenshot="http://www.qtrac.eu/viewpdf.png"
license=('GPL')
arch=('i686' 'x86_64')
depends=('poppler-qt')
install=$pkgname.install
source=("http://www.qtrac.eu/$pkgname-$pkgver.tar.gz" "viewpdf.desktop")
sha1sums=('b157da0f145119f1392c97273e097742bd00d0ee' 'ccd061afebebc7c09b4e127ace729146beb4417e')

build() {
    cd $srcdir/$pkgname-$pkgver
    lrelease-qt4 viewpdf.pro
    qmake-qt4
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver/
    install -Dpm755 -D viewpdf $pkgdir/usr/bin/viewpdf
    install -Dpm644 -D viewpdf.1 $pkgdir/usr/share/man/man1/viewpdf.1
    _docdir=$pkgdir/usr/share/doc/$pkgname-$pkgver
    _pngdir=$pkgdir/usr/share/pixmaps
    _appdir=$pkgdir/usr/share/applications
    install -dpm755 ${_docdir} ${_pngdir} ${_appdir}
    install -Dpm644 CHANGES README help.html ${_docdir}/
    install -Dpm644 images/icon.png ${_pngdir}/$pkgname.png
    install -Dpm644 ../../viewpdf.desktop ${_appdir}/
}
