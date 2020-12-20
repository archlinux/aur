# Maintainer: quickreader <quickreader at mail dot bg>

pkgname='quickreader'
pkgver=1.0
pkgrel=1
pkgdesc='A program that enables its user to quickly read through text by encouraging the silencing of their subvocalization.'
arch=('x86_64')
url="https://gitlab.com/$pkgname/$pkgname"
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme')
source=("https://gitlab.com/$pkgname/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c9bc1385f77db58e7e9a128adaae2d322b0d452c6c105fe0fa95afac1fb34e51')

build() {
    mkdir -v "$srcdir/$pkgname-$pkgver/build"
    cd "$srcdir/$pkgname-$pkgver/build"
    qmake -o Makefile ../QuickReader.pro -spec linux-g++
    make -f Makefile
}

package() {
    mkdir -vp "$pkgdir/usr/bin"
    mkdir -vp "$pkgdir/usr/share/applications"
    mkdir -vp "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -m 755 "$srcdir/$pkgname-$pkgver/build/$pkgname" "$pkgdir/usr/bin"
    install -m 644 "$srcdir/$pkgname-$pkgver/Assets/$pkgname.desktop" "$pkgdir/usr/share/applications"
    install -m 644 "$srcdir/$pkgname-$pkgver/Assets/$pkgname-icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}