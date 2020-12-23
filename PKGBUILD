# Maintainer: quickreader <quickreader at mail dot bg>

pkgname='quickreader'
pkgver=1.0.1
pkgrel=1
pkgdesc='A program that enables its user to quickly read through text by encouraging the silencing of their subvocalization'
arch=('x86_64')
url="https://gitlab.com/$pkgname/$pkgname"
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme')
source=("https://gitlab.com/$pkgname/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('01be997ced3d27f17453ef894eb4351170e896ef8facb4764d86d90dc8bfd2f1')

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