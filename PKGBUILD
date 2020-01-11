# Maintener: Peter Karoly "Stone" JUHASZ <stone@midway.hu>
pkgname=rinetd
pkgver=0.64
pkgrel=6
pkgdesc="internet redirection server"
arch=('i686' 'x86_64')
url="http://www.boutell.com/rinetd"
license=('GPL')
source=(https://github.com/boutell/rinetd/archive/0973bd2d1c187da9706fd83c8aa68fabc1775a31.zip rinetd.service)
md5sums=('a8abec08d78e08f600d64427612e6791'
         'af12522780774cabdb3c9797aa0b55ab')

build() {
  cd $srcdir//rinetd-0973bd2d1c187da9706fd83c8aa68fabc1775a31
  sed -ri 's/log\(/mylog(/;s/\!log\)/!mylog)/' rinetd.c
  sed -ri 's/\/usr\/sbin/\usr\/bin/' Makefile
  cc -DLINUX -g   -c -o rinetd.o rinetd.c
  cc -DLINUX -g   -c -o match.o match.c
  gcc rinetd.o match.o -o rinetd
}

package() {
  install -d $pkgdir/usr/bin
  install -m 700 $srcdir//rinetd-0973bd2d1c187da9706fd83c8aa68fabc1775a31/rinetd $pkgdir/usr/bin/
  install -d $pkgdir/usr/share/man8
  install -m 644 $srcdir//rinetd-0973bd2d1c187da9706fd83c8aa68fabc1775a31/rinetd.8 $pkgdir/usr/share/man8/
  install -d $pkgdir/usr/lib/systemd/system
  install -m 644 $srcdir/rinetd.service $pkgdir/usr/lib/systemd/system/
}
