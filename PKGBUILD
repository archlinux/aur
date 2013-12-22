# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=sokobond
pkgver=20130411
pkgrel=1
pkgdesc="A minimalist puzzle game about bonding chemical elements"
arch=(any)
url="http://www.sokobond.com"
license=(custom:commercial)
depends=(adobe-air)
source=("$pkgname-bin"
        "$pkgname.desktop"
        "$pkgname.png")
md5sums=('f3edf9b80f109d83c7240ae01153de50'
         'f18ec1d1d3e2d8c51ef71f689153f8a3'
         '58ee2375b470f7811ab26632b9f3d0ee')
PKGEXT=.pkg.tar

_archive="${pkgname}_linux_11042013.tar.gz"
_archive_md5='8f554f5d4e262de3ec1d84e2c250cc61'

build () {
    echo "$_archive_md5 $startdir/$_archive" | md5sum -c || {
        echo "archive not found or wrong checksum (Sokobond is a commercial" \
             "game)" 1>&2
        exit 1
    }

    bsdtar -xf "$startdir/$_archive" -C "$srcdir"
}

package () {
    install -Dm644 "$srcdir/$pkgname/$pkgname.air" \
        "$pkgdir/opt/$pkgname/$pkgname.air"
    install -Dm755 "$srcdir/$pkgname-bin" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/$pkgname.png" \
        "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
