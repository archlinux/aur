# Maintainer: Remi Gacogne <rgacogne at archlinux dot org>
pkgname=bgpq3
pkgver=0.1.36.1
pkgrel=1
pkgdesc="bgp filtering automation for Cisco and Juniper routers"
arch=('x86_64')
url="https://github.com/snar/bgpq3"
license=('BSD')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/snar/$pkgname/archive/v$pkgver.tar.gz"
        "bgpq3_install_destdir_cppflags.patch")
sha512sums=('50c53645f806b2fe9bf5008b6dc0b3f54449156988e55ff07f5a15f25c1913ce9eb7bb9dec38af116830188784140ebed1c6b9cbec8fc6b34e550e019e88e332'
            '64b68d520bb2e9668c76d44e073368bb74b26d1b40e1e50849215a721cf9a17179c58a774a082d2c1c2ae7d3e3ee1a8ae4e83e1befcad2c07828a68e2afbd44d')
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
