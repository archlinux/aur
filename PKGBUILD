# Maintainer: Remi Gacogne <rgacogne at archlinux dot org>
pkgname=bgpq3
pkgver=0.1.35
pkgrel=1
pkgdesc="bgp filtering automation for Cisco and Juniper routers"
arch=('x86_64')
url="https://github.com/snar/bgpq3"
license=('BSD')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/snar/$pkgname/archive/v$pkgver.tar.gz"
        "bgpq3_man_install.patch")
sha512sums=('a41a424fc0230a0ab7d64ff017b9c1a52e32d7deae542ba096d4815e0e5ce76342ad55c204bbcc22ae4c47ad486917410c53b0dbb2306d40fa5c5a5cf93fcd01'
            '70abefa578c24f31aef6bedce19f427760fbb0c90fca09bcea977291b65b93f0d6b153aebbf9ea549b338f2c52902c5e5cf055124229be7d0745c7a37b268526')
depends=('glibc')

prepare() {
  cd "$pkgname-$pkgver"

  patch -p1 -i "$srcdir/bgpq3_man_install.patch"
}

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  make prefix="$pkgdir/usr" install
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/$pkgname/README.md"
}
