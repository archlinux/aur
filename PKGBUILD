# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=swbis
pkgver=1.13.3
pkgrel=4
pkgdesc="software packaging -- again"
arch=(i686 x86_64)
url='https://www.gnu.org/software/swbis/'
license=('GPL-3.0-or-later')
depends=(bash gawk gcc-libs glibc)
optdepends=(inetutils)
source=(https://ftp.gnu.org/gnu/swbis/$pkgname-$pkgver.tar.gz automake.patch)
md5sums=('0106914abde67de1c44cf67d2a1be557' 'ddb03ef20c340416f14f7fe9f23caf9e')

prepare(){
cd "$pkgname-$pkgver"
# diff against /usr/share/automake-1.16/config.guess from automake 1.16.5-2 
patch -Np0 -i ../automake.patch
}
build(){
cd "$pkgname-$pkgver"
CFLAGS="$CFLAGS -Wno-error=implicit-function-declaration -Wno-int-conversion"
LDFLAGS+=' -Wl,-z,shstk'
./configure --prefix=/usr --libexecdir=/usr/lib 
make -j1 # https://savannah.gnu.org/support/index.php?111050
}
package(){
cd "$pkgname-$pkgver"
make DESTDIR="$pkgdir/" install
}
