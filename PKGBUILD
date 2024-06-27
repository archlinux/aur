# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Johan Svensson <johan@loxley.se>
pkgname=logwarn
pkgver=1.0.17
pkgrel=3
pkgdesc="Utility for finding interesting messages in log files"
arch=('i686' 'x86_64')
url="https://code.google.com/p/logwarn"
license=('Apache-2.0')
depends=('bash' 'glibc')
source=($pkgname-$pkgver.tar.gz::https://github.com/archiecobbs/logwarn/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('e928522045dee389862dce8031fb45e4db2a17ab94062427c1d00c54d1e5d29f')

build() {
    cd $srcdir/$pkgname-$pkgver
    ./autogen.sh
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
    mv AUTHORS CHANGES README.md $pkgdir/usr/share/doc/$pkgname/
}
