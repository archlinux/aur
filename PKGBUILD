# Maintainer: Remi Gacogne <rgacogne-arch at coredump dot fr>
pkgname=bgpq3
pkgver=0.1.31
pkgrel=1
pkgdesc="bgp filtering automation for Cisco and Juniper routers"
arch=('i686' 'x86_64')
url="https://github.com/snar/bgpq3"
license=('BSD')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/snar/$pkgname/archive/v$pkgver.tar.gz"
        "bgpq3_man_install.patch")
sha512sums=('91f9b7b7e89576f162afe53ad66654f948ff73a1fc93c47f8a02a6303ba6d3a607d821696d5e342a62d37f508c830d3e1f5ac8729a182bbfbe4c527e7de9abae'
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
