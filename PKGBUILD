# Contributor: ezzetabi <ezzetabi@gawab.com>
# Contributor: Sebastian Schwarz <seschwar@gmail.com>

pkgname=mirage2iso
pkgver=0.4.1
pkgrel=1
pkgdesc="libmirage-based CD/DVD image file converter"
arch=(i686 x86_64)
url=https://bitbucket.org/mgorny/mirage2iso
license=(BSD3)
depends=(libassuan libmirage)
source=(https://bitbucket.org/mgorny/$pkgname/downloads/$pkgname-$pkgver.tar.bz2
        https://bitbucket.org/mgorny/$pkgname/downloads/$pkgname-0.3-tests.tar.xz)
noextract=($pkgname-0.3-tests.tar.xz)
md5sums=(30587f5f6540add4474dc8485435fa71
         2c2d3611a02efdbf0015cd6b4c1cd3ae)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    bsdtar xf "$srcdir/$pkgname-0.3-tests.tar.xz" --strip-components 1
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make -k check
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING.txt"
}
