# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=tcpick
pkgver=0.2.1
pkgrel=3
pkgdesc='Tcp stream sniffer and connection tracker'
arch=('i686' 'x86_64')
depends=('libpcap')
url='http://tcpick.sourceforge.net'
license=('GPL')
source=(http://prdownloads.sourceforge.net/tcpick/$pkgname-$pkgver.tar.gz
        CVE-2006-0048.patch
        fix-build-with-gcc5.patch
        fix-double-free-error.patch
        fix-infinite-loop-on-powerpc.patch
        fix-man-invocation.patch
        fix-globals.patch)
md5sums=('bb94f2f9ea81aeb645619fbe9b3b9a29'
         '3efd250f8cb6a308dd07ae858562ccc3'
         'b6a7330a1a8b0b79a7d1db73712db0c2'
         '391c336816f126ecbf7e6c219905340f'
         '8c468789fb553f7d31ae48cfc260409d'
         '3a2107306148df3d792aa796b04a3309'
         '1e3d45fdb8accc66f6bb1a47503396ea')

prepare() {
    cd $srcdir/$pkgname-$pkgver
    patch -Np1 -i ../CVE-2006-0048.patch
    patch -Np1 -i ../fix-build-with-gcc5.patch
    patch -Np1 -i ../fix-double-free-error.patch
    patch -Np1 -i ../fix-infinite-loop-on-powerpc.patch
    patch -Np1 -i ../fix-man-invocation.patch
    patch -Np1 -i ../fix-globals.patch
}

build() {
    cd $srcdir/$pkgname-$pkgver
    ./configure \
        --prefix=/usr \
        --mandir=/usr/share/man
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make install DESTDIR=$pkgdir
    rm $pkgdir/usr/share/man/man8/tcpick_italian.8
}
