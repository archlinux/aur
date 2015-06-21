# Maintainer: Mike Sampson <mike at sambodata dot com>
# Contributor: <ndowens04@gmail.com>
pkgname=ctunnel
pkgver=0.4
pkgrel=1
pkgdesc="a command line program for tunneling and/or proxying TCP or UDP \\
    connections via a cryptographic tunnel."
arch=('i686' 'x86_64')
url="http://nardcore.org/ctunnel"
license=('GPL')
depends=('zlib' 'libgcrypt')
source=(http://nardcore.org/ctunnel/$pkgname-$pkgver.tar.gz)
md5sums=('935c58907f510df454444f15ee467533')

build() {
    cd $srcdir/$pkgname-$pkgver
    sed -i 's/-lgcrypt/-lgcrypt -lgpg-error/' src/Makefile
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    install -m755 -D src/$pkgname $pkgdir/usr/bin/$pkgname
    install -m644 -D $pkgname.1 $pkgdir/usr/share/man/man1/$pkgname.1
}
