# Maintainer: Remi Gacogne <rgacogne at archlinux dot org>
pkgname=bgpq3
pkgver=0.1.38
pkgrel=1
pkgdesc="bgp filtering automation for Cisco and Juniper routers"
arch=('x86_64')
url="https://github.com/snar/bgpq3"
license=('BSD')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/snar/$pkgname/archive/v$pkgver.tar.gz"
        "bgpq3_install_destdir_cppflags.patch")
sha512sums=('c10542db95fc13b21d418aacc3eefed54082e6bf46a658c873f04f7798f1088c1da7cee746415f79ed57e9765747ffcb1bb8816852ad9deee8161f85e8a065d8'
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
