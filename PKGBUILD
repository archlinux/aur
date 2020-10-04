# Maintainer: Remi Gacogne <rgacogne at archlinux dot org>
pkgname=bgpq3
pkgver=0.1.35
pkgrel=2
pkgdesc="bgp filtering automation for Cisco and Juniper routers"
arch=('x86_64')
url="https://github.com/snar/bgpq3"
license=('BSD')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/snar/$pkgname/archive/v$pkgver.tar.gz"
        "bgpq3_install_destdir_cppflags.patch")
sha512sums=('a41a424fc0230a0ab7d64ff017b9c1a52e32d7deae542ba096d4815e0e5ce76342ad55c204bbcc22ae4c47ad486917410c53b0dbb2306d40fa5c5a5cf93fcd01'
            'de8089c3d11cc7bdaee692275eb6e9cba3091ebfb8f4db63a735f576ede0ade15cd99635c50d0f083a3ad390fe98ec7ba20f6436acaee9d9090cfffd36b7dc74')
depends=('glibc')

prepare() {
  cd "$pkgname-$pkgver"

  patch -p1 -i "$srcdir/bgpq3_install_destdir_cppflags.patch"
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
