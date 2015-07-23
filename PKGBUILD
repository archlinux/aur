# Contributor: linuxSEAT <--put_my_name_here--@gmail.com>

pkgname=itools
pkgver=1.0
pkgrel=5
pkgdesc="Islamic console tools (ical, idate, ipraytime, ireminder)"
url="http://www.arabeyes.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc' 'libitl' 'perl')
source=(http://downloads.sourceforge.net/arabeyes/$pkgname-$pkgver.tar.gz
        itools-1.0-ipraytime-in-utf8.patch)
md5sums=(4ac97946b906caa021c6c9cab5798079
        e405a35870fdf71282b84b66213e82da)

package() {
  LDFLAGS=""
  cd $srcdir/$pkgname-$pkgver 
  patch -p1 -i ../itools-1.0-ipraytime-in-utf8.patch || return 1
  ./autogen.sh
  ./configure --prefix=$pkgdir/usr
  make install || return 1
  mkdir -p $pkgdir/usr/share || return 1
  mv $pkgdir/usr/man $pkgdir/usr/share/ || return 1
}
