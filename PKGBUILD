# Maintainer: Johan Svensson <johan@loxley.se>
pkgname=logwarn
pkgver=1.0.11
pkgrel=1
pkgdesc="Utility for finding interesting messages in log files"
arch=('i686' 'x86_64')
url="https://code.google.com/p/logwarn"
license=('APACHE')
source=(https://logwarn.googlecode.com/files/logwarn-$pkgver.tar.gz)
sha256sums=('fe5d7e5a40908489a243f2d7ccb37af583e74f072e3cb6012e5b3f3e68e0bad8')

build() {
    cd $srcdir/$pkgname-$pkgver

    ./configure
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver

    mkdir -p $pkgdir/{usr/share/{doc/$pkgname,licenses/$pkgname,man/man1},var/lib/$pkgname}

    install -Dm755 $srcdir/$pkgname-$pkgver/$pkgname $pkgdir/usr/bin/$pkgname
    install -Dm644 $srcdir/$pkgname-$pkgver/check_$pkgname $pkgdir/usr/share/doc/$pkgname/check_$pkgname

    gzip -c $srcdir/$pkgname-$pkgver/$pkgname.1 > $pkgdir/usr/share/man/man1/$pkgname.1.gz

    mv COPYING $pkgdir/usr/share/licenses/$pkgname/
    mv AUTHORS CHANGES README $pkgdir/usr/share/doc/$pkgname/
}
