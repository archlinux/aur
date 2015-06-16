# Maintainer: adytzu2007 <adybac at gmail dot com>

pkgname=gqlplus
pkgver=1.15
pkgrel=1
pkgdesc="Oracle SQLPlus front-end that provides, history and completion"
url="http://gqlplus.sourceforge.net/"
license=('GPL')
arch=('x86_64')
depends=('xdg-utils')
makedepends=('autoconf' 'automake')
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/${pkgname}-${pkgver}.tar.gz"
        "$pkgname.desktop"
        "$pkgname.png")
md5sums=('d60e4768b3c065d52a19658d295e8fe8'
         '6c8c81ae7ac03b97850e4e0443562a6c'
         '46f2bc2f305d852242aa77918f80eab4')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    sed -i 's/\[1\.14\]/\[1\.15\]/g' configure.ac

    automake --add-missing
    aclocal && autoconf

    ./configure --prefix=/usr \
        --sysconfdir=/etc

    make
}

package() {
    cd "$srcdir"

    ls

    install -Dm664 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm664 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
