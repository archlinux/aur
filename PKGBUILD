# Maintainer: Luke R. <g4jc@bulletmail.org> GPG:  c25519/D85D2F527B0

pkgname=uftp
pkgver=4.9.4
pkgrel=1
pkgdesc="UFTP is an encrypted multicast file transfer program, designed 
to securely, reliably, and efficiently transfer files to multiple 
receivers simultaneously."
arch=(i686 x86_64)
url="https://uftp-multicast.sourceforge.net/"
license=('GPL3')
makedepends=('gcc' 'openssl')
source=("https://downloads.sourceforge.net/project/$pkgname-multicast/source-tar/$pkgname-$pkgver.tar.gz")
sha512sums=('f3c799265a55e0cb536f17be3a0ebfad5f81284255083ebe9a12fda4b5ce8407f05a710cb32a41f3dccbc0ac90367c44d4b67058bdbeaa4f2f8efe732463ebf0')
whirlpoolsums=('ae69a1a7b3ff7039e5f70f24d486b84d1f3fa9d39ebade82fca388bbe97f06d7aad78f22c662065f48f23f43aba5efa7aa87516c2b60df98ce5794d25c99730b')

-prepare() {
  cd "$srcdir/${pkgname}-${pkgver}/"
}

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  make all || return 1
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
  mv $pkgdir/usr/sbin/* $pkgdir/usr/bin
  rm -rf $pkgdir/usr/sbin
}
