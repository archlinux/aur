# Maintener: Peter Karoly "Stone" JUHASZ <stone@midway.hu>
pkgname=rinetd
pkgver=0.62
pkgrel=6
pkgdesc="internet redirection server"
arch=('i686' 'x86_64')
url="http://www.boutell.com/rinetd"
license=('GPL')
source=(http://www.boutell.com/rinetd/http/$pkgname.tar.gz rinetd.service)
md5sums=('28c78bac648971724c46f1a921154c4f'
         'af12522780774cabdb3c9797aa0b55ab')

build() {
  cd $srcdir/$pkgname
  sed -ri 's/log\(/mylog(/;s/\!log\)/!mylog)/' rinetd.c
  sed -ri 's/\/usr\/sbin/\usr\/bin/' Makefile
  cc -DLINUX -g   -c -o rinetd.o rinetd.c
  cc -DLINUX -g   -c -o match.o match.c
  gcc rinetd.o match.o -o rinetd
}

package() {
  install -d $pkgdir/usr/bin
  install -m 700 $srcdir/rinetd/rinetd $pkgdir/usr/bin/
  install -d $pkgdir/usr/share/man8
  install -m 644 $srcdir/rinetd/rinetd.8 $pkgdir/usr/share/man8/
  install -d $pkgdir/usr/lib/systemd/system
  install -m 644 $srcdir/rinetd.service $pkgdir/usr/lib/systemd/system/
}
