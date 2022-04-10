# Contributor: linuxSEAT <--put_my_name_here--@gmail.com>

pkgname=itools
pkgver=1.0
pkgrel=6
pkgdesc="Islamic console tools (ical, idate, ipraytime, ireminder)"
url="http://www.arabeyes.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc' 'libitl' 'perl')
source=(http://downloads.sourceforge.net/arabeyes/$pkgname-$pkgver.tar.gz
        $pkgname-$pkgver.patch)
md5sums=('4ac97946b906caa021c6c9cab5798079'
         '102bca4a8732d02dcd3dc849c5a93f83')

package() {
  LDFLAGS=""
  cd $srcdir/$pkgname-$pkgver 
  patch -p1 -i ../$pkgname-$pkgver.patch || return 1
  ./autogen.sh
  ./configure --prefix=$pkgdir/usr
  make install || return 1
  mkdir -p $pkgdir/usr/share || return 1
  mv $pkgdir/usr/man $pkgdir/usr/share/ || return 1
}
