pkgname=ipsc
pkgver=0.4.3
pkgrel=6
pkgdesc="Allows network administrators to make calculations that will assist in subnetting a network"
arch=('i686' 'x86_64')
url="http://packages.ubuntu.com/dapper/ipsc"
license=('GPL')
source=(http://old-releases.ubuntu.com/ubuntu/pool/universe/i/ipsc/ipsc_0.4.3.orig.tar.gz
        http://old-releases.ubuntu.com/ubuntu/pool/universe/i/ipsc/ipsc_0.4.3-2.diff.gz
        http://ftp.de.debian.org/debian/pool/main/p/prips/prips_0.9.7.orig.tar.gz)
md5sums=('0adc2e6073d4aaba8a2e43215d9d25a0'
         'e08a7f11e60223d59de0c5df93e99c24'
         '66efd4f714275413e48749d43903134f')

build() {
  cd "$pkgname-$pkgver"

  patch -p1 -i "$srcdir/ipsc_0.4.3-2.diff"

  for file in debian/patches/*.dpatch; do
    sh $file -patch
  done

  cd "$srcdir/$pkgname-$pkgver/src"
  cp "$srcdir"/prips-0.9.7/prips.* "$srcdir/$pkgname-$pkgver/src/"
  make ipsc
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 src/ipsc "$pkgdir/usr/bin/ipsc"
  install -Dm644 src/ipsc.1 "$pkgdir/usr/share/man/man1/ipsc.1"
}

# vim:set ts=2 sw=2 et:
