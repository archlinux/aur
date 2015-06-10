# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Nick Smallbone <nick.smallbone@gmail.com>

pkgname=tofrodos
pkgver=1.7.13
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Convert ASCII files between the MS-DOS/Windows format and the UNIX format"
url="http://www.thefreecountry.com/tofrodos/index.shtml"
license=('GPL2')
conflicts=('dos2unix' 'hd2u')
depends=('glibc')
source=(http://$pkgname.sourceforge.net/download/$pkgname-$pkgver.tar.gz)
md5sums=('c4c5e6668a13a01bfb5ce562753a808f')

build() {
  export CFLAGS+=" -c -Wall"
  cd "$pkgname/src"
  make -e
}

package() {
  cd "$pkgname/src"
  install -d "$pkgdir"/usr/{bin,share/man/man1}
  make BINDIR="$pkgdir/usr/bin" MANDIR="$pkgdir/usr/share/man/man1" install
  ln -s todos "$pkgdir/usr/bin/unix2dos"
  ln -s fromdos "$pkgdir/usr/bin/dos2unix"
}
