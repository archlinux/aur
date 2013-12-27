# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=sokobond
pkgver=20130411
pkgrel=3
pkgdesc="A minimalist puzzle game about bonding chemical elements"
arch=(any)
url="http://www.sokobond.com"
license=(custom:commercial)
makedepends=(unzip)
depends=(adobe-air-sdk)
source=("$pkgname-bin"
        "$pkgname.desktop"
        "$pkgname.png")
md5sums=('623d50caa3b22cf956c7b00a88f780f2'
         'f18ec1d1d3e2d8c51ef71f689153f8a3'
         '018765159d0ac8f32c422d50e282c59f')
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
    mkdir -p "$srcdir/air"
    unzip -o -d "$srcdir/air" "$srcdir/$pkgname/$pkgname.air" 
}

package () {
    install -d "$pkgdir/opt/"
    cp -a "$srcdir/air/" "$pkgdir/opt/$pkgname/"
    install -Dm755 "$srcdir/$pkgname-bin" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/$pkgname.png" \
        "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
