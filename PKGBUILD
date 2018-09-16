# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=cosmic-express
pkgver=1.0.4
pkgrel=1
pkgdesc="A puzzle game about planning the train route for the world's most awkward space colony"
arch=(i686 x86_64)
url="https://cosmicexpressgame.com"
license=(custom:commercial)
makedepends=(unzip)
depends=(libgl libx11 libxcursor libxrandr)
source=("$pkgname-bin"
        "$pkgname.desktop"
        "$pkgname.png")
md5sums=('a30146524ba85b90273f4266e6b8ba06'
         'cbd7830bc31a155a1b2e1bf47e570ae8'
         'bfc09a1376c7a280e4174c49db48dfe1')
PKGEXT=.pkg.tar

_archive="cosmic-express-linux.zip"
_archive_md5='145789ba0550e5a7e440577f0aec7963'

build () {
    echo "$_archive_md5 $startdir/$_archive" | md5sum -c || {
        echo "archive not found or wrong checksum (Cosmic Express is a" \
             "commercial game)" 1>&2
        exit 1
    }
    unzip "$startdir/$_archive" -d "$srcdir"
}

package () {
    install -d "$pkgdir/opt/$pkgname"
    cp -a "$srcdir/Cosmic Express_Data" "$pkgdir/opt/$pkgname/"
    install -m755 "$srcdir/Cosmic Express.x86_64" "$pkgdir/opt/$pkgname/"
    install -m755 "$srcdir/Cosmic Express.x86" "$pkgdir/opt/$pkgname/"
    install -Dm755 "$srcdir/$pkgname-bin" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/$pkgname.png" \
        "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
