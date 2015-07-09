# Maintainer: Linus Östberg <aur talavis eu >
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=kalign
pkgver=2.0.4
origver=2.0.4
pkgrel=2
pkgdesc="A fast and accurate multiple sequence alignment algorithm designed to align large numbers of sequences"
arch=('i686' 'x86_64')
url="http://msa.sbc.su.se"
license=('GPL2')
depends=('glibc')
source=(http://msa.sbc.su.se/downloads/$pkgname/current.tar.gz)
md5sums=('bde173eb65e617ed73cd78bad7f881a3')

build() {
  cd $srcdir/
  ./configure || return 1
   if [ "${CARCH}" = "i686" ]; then
    make CFLAGS=" -march=i686 -mtune=generic -O3 -pipe" LDLIBS=" -lm" || return 1
  else
    make CFLAGS=" -march=x86-64 -mtune=generic -O3 -pipe" LDLIBS=" -lm" || return 1
  fi
}

package() {
  install -D -m755 kalign $pkgdir/usr/bin/kalign
}
