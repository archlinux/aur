# Maintainer: Remi Gacogne <rgacogne at archlinux dot org>
pkgname=bgpq3
pkgver=0.1.33
pkgrel=1
pkgdesc="bgp filtering automation for Cisco and Juniper routers"
arch=('i686' 'x86_64')
url="https://github.com/snar/bgpq3"
license=('BSD')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/snar/$pkgname/archive/v$pkgver.tar.gz"
        "bgpq3_man_install.patch")
sha512sums=('f4faec46eaa5fe77a9118ed76e3d2dddce855cebfe6ead3dadffe0f72ea720502e378febd04829409039fd2bd6a693e518814408c628df1a9e5c7e7c5c170f49'
            '70abefa578c24f31aef6bedce19f427760fbb0c90fca09bcea977291b65b93f0d6b153aebbf9ea549b338f2c52902c5e5cf055124229be7d0745c7a37b268526')
depends=('glibc')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 -i "$srcdir/bgpq3_man_install.patch"
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
