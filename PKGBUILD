# Maintainer: Remi Gacogne <rgacogne-arch at coredump dot fr>
pkgname=bgpq3
pkgver=0.1.29
pkgrel=1
pkgdesc="bgp filtering automation for Cisco and Juniper routers"
arch=('i686' 'x86_64')
url="https://github.com/snar/bgpq3"
license=('BSD')
source=(https://github.com/snar/$pkgname/archive/v$pkgver.tar.gz
        bgpq3_man_install.patch)
sha512sums=('41ddbac345cc1b9da79b35bd6beda1ec803f675b1aa2504737f0d964a9e93388dd885d227ffd70141e83fb53e6b65ec0afc43535bfa402d20579c88148306029'
            '70abefa578c24f31aef6bedce19f427760fbb0c90fca09bcea977291b65b93f0d6b153aebbf9ea549b338f2c52902c5e5cf055124229be7d0745c7a37b268526')
depends=('glibc')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 -i $srcdir/bgpq3_man_install.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  make prefix="$pkgdir/usr" install
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
